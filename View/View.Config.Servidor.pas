unit View.Config.Servidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TfrmConfigServidor = class(TForm)
    shpFundo: TShape;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel6: TPanel;
    Panel5: TPanel;
    btnConfirmar: TSpeedButton;
    Panel7: TPanel;
    btnCancelar: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    edtServidor: TEdit;
    edtPorta: TEdit;
    edtNomeBanco: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtServidorAtual: TEdit;
    Label11: TLabel;
    edtNomeBancoAtual: TEdit;
    Label12: TLabel;
    edtLoginAtual: TEdit;
    edtSenhaAtual: TEdit;
    Label13: TLabel;
    edtPortaAtual: TEdit;
    Label14: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigServidor: TfrmConfigServidor;

implementation

uses
  unit_funcoes, View.DTMPrincipal;

{$R *.dfm}

procedure TfrmConfigServidor.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigServidor.btnConfirmarClick(Sender: TObject);
begin
  prc_Validar_Campos_Obrigatorios( frmConfigServidor );

  DataModule1.Conexao.Server   := edtServidor.Text;
  DataModule1.Conexao.Database := edtNomeBanco.Text;
  DataModule1.Conexao.Port     := edtPorta.Text;
  DataModule1.Conexao.Username := edtLogin.Text;
  DataModule1.Conexao.Password := edtSenha.Text;

  DataModule1.Conexao.prc_Gravar_Arquivo_Ini;

  if DataModule1.Conexao.fnc_conectar_banco_dados then
  begin
    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                       'CONECTADO AO BANCO DE DADOS',
                       'Conexão com o Banco de Dados Realizada com SUCESSO! ' +
                       'O Sistema deve ser reiniciado!',
                       ExtractFilePath( Application.ExeName ) + '\Icons\Aviso_.png',
                       'OK');
    Application.Terminate;
  end
  else
  begin
    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                       'ERRO AO CONECTAR AO BANCO DE DADOS',
                       'Não foi possível conecar ao Banco de Dados, possível causa: '+
                       DataModule1.Conexao.MsgErro,
                       ExtractFilePath( Application.ExeName ) + '\Icons\Erro.png',
                       'OK');

    edtServidor.SetFocus;
  end;
end;

procedure TfrmConfigServidor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform( WM_NEXTDLGCTL,0,0 )
  else if Key = VK_TAB then
    Perform( WM_NEXTDLGCTL,1,0 )
end;

procedure TfrmConfigServidor.FormShow(Sender: TObject);
begin
  if DataModule1.Conexao.fnc_Ler_Arquivo_Ini then
  begin
    edtServidorAtual.Text  := DataModule1.Conexao.Server;
    edtNomeBancoAtual.Text := DataModule1.Conexao.Database;
    edtPortaAtual.Text     := DataModule1.Conexao.Port;
    edtLoginAtual.Text     := DataModule1.Conexao.Username;
    edtSenhaAtual.Text     := DataModule1.Conexao.Password;
  end;
end;

end.
