unit unit_funcoes;

interface

uses
  View.Mensagens, System.SysUtils, FireDAC.Comp.Client,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

  procedure prc_Validar_Campos_Obrigatorios( Form : TForm );
  function fnc_Remove_Caracteres( AString : string ): string;
  function fnc_criar_mensagem ( TituloJanela, TituloMSG, MSG, Icone, Tipo : string ): Boolean;
  function fnc_proximo_codigo( Tabela, Campo: string ): Integer;

implementation

uses
  View.DTMPrincipal;

procedure prc_Validar_Campos_Obrigatorios( Form : TForm );
var
  i: Integer;
begin
  for i := 0 to Form.ComponentCount - 1 do
  begin
    if Form.Components[i].Tag = 5 then
    begin
      //TEdit
      if Form.Components[i] is TEdit then
      begin
        if ( ( Form.Components[i] as TEdit ).Hint <> EmptyStr ) and
           ( ( Form.Components[i] as TEdit ).Text = EmptyStr ) and
           ( Trim( fnc_Remove_Caracteres( ( Form.Components[i] as TEdit ).Text ) ) = EmptyStr ) then
        begin
          fnc_criar_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                     'Tem certeza de que deseja continuar?',
                     'O campo ' + ( Form.Components[i] as TEdit ).Hint + ' � de preenchimento obrigat�rio',
                     ExtractFilePath( Application.ExeName ) + '\Icons\Aviso_.png',
                     'AVISO');

          if ( ( Form.Components[i] as TEdit ).Enabled ) then
            ( Form.Components[i] as TEdit ).SetFocus;

          Abort;
        end;
      end;

      //TMaskEdit
      if Form.Components[i] is TMaskEdit then
      begin
        if ( ( Form.Components[i] as TMaskEdit ).Hint <> EmptyStr ) and
           ( ( Form.Components[i] as TMaskEdit ).Visible ) and
           ( Trim( fnc_Remove_Caracteres( ( Form.Components[i] as TMaskEdit ).Text ) ) = EmptyStr ) then
        begin
          fnc_criar_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                     'Tem certeza de que deseja continuar?',
                     'O campo ' + ( Form.Components[i] as TMaskEdit ).Hint + ' � de preenchimento obrigat�rio',
                     ExtractFilePath( Application.ExeName ) + '\Icons\Aviso_.png',
                     'AVISO');

          if ( ( Form.Components[i] as TMaskEdit ).Enabled ) then
            ( Form.Components[i] as TMaskEdit ).SetFocus;

          Abort;
        end;
      end;

      //TComboBox
      if Form.Components[i] is TComboBox then
      begin
        if ( ( Form.Components[i] as TComboBox ).Hint <> EmptyStr ) and
           ( ( Form.Components[i] as TComboBox ).Text = EmptyStr ) and
           ( Trim( fnc_Remove_Caracteres( ( Form.Components[i] as TComboBox ).Text ) ) = EmptyStr ) then
        begin
          fnc_criar_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                     'Tem certeza de que deseja continuar?',
                     'O campo ' + ( Form.Components[i] as TComboBox ).Hint + ' � de preenchimento obrigat�rio',
                     ExtractFilePath( Application.ExeName ) + '\Icons\Aviso_.png',
                     'AVISO');

          if ( ( Form.Components[i] as TComboBox ).Enabled ) then
            ( Form.Components[i] as TComboBox ).SetFocus;

          Abort;
        end;
      end;
    end;
  end;
end;

function fnc_Remove_Caracteres( AString : string ): string;
var
  i : Integer;
  sLimpos : string;
begin
  sLimpos := EmptyStr;

  for i := 1 to Length( AString ) do
  begin
    if Pos( Copy( AString, i, 1 ), '"!%$#@&@*().,;:/<>[]{}=+-_\|' ) = 0 then
      sLimpos := sLimpos + Copy( AString, i, 1 );
  end;

  Result := sLimpos;
end;

function fnc_criar_mensagem ( TituloJanela, TituloMSG, MSG, Icone, Tipo : string ): Boolean;
begin
  frmMensagens               := TfrmMensagens.Create( nil );
  frmMensagens.sTituloJanela := TituloJanela;
  frmMensagens.sTituloMsg    := TituloMSG;
  frmMensagens.sMensagem     := MSG;
  frmMensagens.sCaminhoIcone := Icone;
  frmMensagens.sTipo         := Tipo;

  frmMensagens.ShowModal;

  Result := frmMensagens.bRespostaMSG;
end;

function fnc_proximo_codigo( Tabela, Campo: string ): Integer;
var
  QryConsulta: TFDQuery;
begin
  Result := 1;

  DataModule1.FDConnection.Connected := False;
  DataModule1.FDConnection.Connected := True;

  QryConsulta := TFDQuery.Create( nil );
  QryConsulta.Connection := DataModule1.FDConnection;

  try
    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('select max( ' + Campo + ' ) as codigo from ' + Tabela);
    QryConsulta.Open;

    if QryConsulta.FieldByName('codigo').AsString <> EmptyStr then
      Result := QryConsulta.FieldByName('codigo').AsInteger + 1;
  finally
    QryConsulta.Destroy;
  end;
end;

end.

