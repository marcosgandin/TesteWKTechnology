unit Classe.Conexao;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, System.IniFiles,
  Vcl.Forms, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB;

type
  TConexao = class
    private
      FConexao: TFDConnection;
      FServer: string;
      FDatabase: string;
      FPort: string;
      FUsername: string;
      FPassword: string;
      FMsgErro: string;
    public
      constructor Create ( NomeConexao : TFDConnection );
      destructor Destroy; override;

      procedure prc_Gravar_Arquivo_Ini;
      function fnc_Ler_Arquivo_Ini: Boolean;
      function fnc_conectar_banco_dados: Boolean;

      property Conexao  : TFDConnection read FConexao write FConexao;
      property Server   : string read FServer write FServer;
      property Database : string read FDatabase write FDatabase;
      property Port     : string read FPort write FPort;
      property Username : string read FUsername write FUsername;
      property Password : string read FPassword write FPassword;
      property MsgErro  : string read FMsgErro write FMsgErro;
  end;

implementation

{ TConexao }

constructor TConexao.Create( NomeConexao: TFDConnection );
begin
  FConexao := NomeConexao;
end;

destructor TConexao.Destroy;
begin
  FConexao.Connected := False;

  inherited;
end;

function TConexao.fnc_conectar_banco_dados: Boolean;
begin
  Result := True;

  FConexao.Params.Clear;

  if not fnc_Ler_Arquivo_Ini then
  begin
    Result   := False;
    FMsgErro := 'O arquivo de Configura��o n�o foi encontrado!';
  end
  else
  begin
    FConexao.Connected := False;
    FConexao.LoginPrompt := False;
    FConexao.DriverName := 'MySQL';
    FConexao.Params.Clear;
    FConexao.Params.Add('Server=' + FServer);
    FConexao.Params.Add('Database=' + FDatabase);
    FConexao.Params.Add('Port=' + FPort);
    FConexao.Params.Add('Username=' + FUsername);
    FConexao.Params.Add('Password=' + FPassword);
    FConexao.Params.Add('DriverID=MySQL');

    try
      FConexao.Connected := True;
    except
      on e:Exception do
      begin
        FMsgErro := e.Message;
        Result   := False;
      end;
    end;
  end;
end;

procedure TConexao.prc_Gravar_Arquivo_Ini;
var
  IniFile : string;
  Ini : TIniFile;
begin
  IniFile := ChangeFileExt( Application.ExeName, '.ini' );
  Ini     := TIniFile.Create( IniFile );

  try
    Ini.WriteString('Config','Server',FServer);
    Ini.WriteString('Config','Database',FDatabase);
    Ini.WriteString('Config','Port',FPort);
    Ini.WriteString('Config','Username',FUsername);
    Ini.WriteString('Config','Password',FPassword);
  finally
    Ini.Free;
  end;
end;

function TConexao.fnc_Ler_Arquivo_Ini: Boolean;
var
  IniFile : string;
  Ini : TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);

  if not FileExists( IniFile ) then
    Result := False
  else
  begin
    try
      FServer   := Ini.ReadString('Config','Server', '');
      FDatabase := Ini.ReadString('Config','Database', '');
      FPort     := Ini.ReadString('Config','Port', '');
      FUsername := Ini.ReadString('Config','Username', '');
      FPassword := Ini.ReadString('Config','Password ', '');
    finally
      Result := True;
      Ini.Free;
    end;
  end;
end;

end.
