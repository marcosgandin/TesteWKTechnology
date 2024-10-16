program TesteWKTechnology;

uses
  Vcl.Forms,
  System.SysUtils,
  View.Principal in 'View\View.Principal.pas' {frmPrincipal},
  View.Config.Servidor in 'View\View.Config.Servidor.pas' {frmConfigServidor},
  View.Mensagens in 'View\View.Mensagens.pas' {frmMensagens},
  Model.Produtos in 'Model\Model.Produtos.pas',
  Model.Pedidos.Produtos in 'Model\Model.Pedidos.Produtos.pas',
  Model.Pedidos.Dados.Gerais in 'Model\Model.Pedidos.Dados.Gerais.pas',
  Model.Clientes in 'Model\Model.Clientes.pas',
  unit_funcoes in 'View\unit_funcoes.pas',
  Classe.Conexao in 'Model\Classe.Conexao.pas',
  View.DTMPrincipal in 'View\View.DTMPrincipal.pas' {DataModule1: TDataModule},
  Controller.Produtos in 'Controller\Controller.Produtos.pas',
  Controller.Clientes in 'Controller\Controller.Clientes.pas',
  Controller.Pedidos.Produtos in 'Controller\Controller.Pedidos.Produtos.pas',
  Controller.Pedidos.Dados.Gerais in 'Controller\Controller.Pedidos.Dados.Gerais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  if not DataModule1.Conexao.fnc_conectar_banco_dados then
  begin
    fnc_criar_mensagem('CONEXÃO AO BANCO DE DADOS',
                       'ERRO AO CONECTAR AO BANCO DE DADOS',
                       'Não foi possível conecar ao Banco de Dados, possível causa: '+
                       DataModule1.Conexao.MsgErro,
                       ExtractFilePath( Application.ExeName ) + '\Icons\Erro.png',
                       'OK');
   	Application.CreateForm(TfrmConfigServidor, frmConfigServidor);
  frmConfigServidor.ShowModal;
  end;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
