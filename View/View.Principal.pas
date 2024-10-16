unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    shpFundo: TShape;
    lblPedidoVenda: TLabel;
    lblCliente: TLabel;
    Panel2: TPanel;
    lblCodProduto: TLabel;
    lblDescProduto: TLabel;
    edtCodProduto: TEdit;
    edtDescProduto: TEdit;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    lblTotal: TLabel;
    edtTotal: TEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    btnGravarPedido: TSpeedButton;
    Panel3: TPanel;
    btnInsereProduto: TSpeedButton;
    grdItems: TStringGrid;
    lblPedido: TLabel;
    edtPedido: TEdit;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInsereProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPedidoExit(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
  private
    lCont: integer;
    lVlrUnitario: currency;

    procedure LimpaCampos;
  public
    { Public declarations }
  end;

type
  TDBGridPadrao = class(TDBGrid);

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  View.DTMPrincipal,
  Model.Produtos,
  Controller.Produtos,
  Model.Clientes,
  Controller.Clientes,
  Model.Pedidos.Produtos,
  Controller.Pedidos.Produtos,
  Model.Pedidos.Dados.Gerais,
  Controller.Pedidos.Dados.Gerais,
  unit_funcoes;

{$R *.dfm}

procedure TfrmPrincipal.btnGravarPedidoClick(Sender: TObject);
begin
  var lObjPedidosProdutos: TPedidosProdutos;
  var lObjCtrlPedidosProdutos: TControllerPedidosProdutos;
  var iRow: byte;
  var lResposta: string;

  for iRow := 1 to lCont do
  begin
    try
      lObjPedidosProdutos := TPedidosProdutos.Create(DataModule1.FDConnection);
      lObjCtrlPedidosProdutos := TControllerPedidosProdutos.Create;

      lObjPedidosProdutos.Id_Ped_Dados_Gerais := StrToInt(grdItems.cells[1,iRow]);
      lObjPedidosProdutos.Id_Produtos :=  StrToInt(grdItems.cells[2,iRow]);
      lObjPedidosProdutos.Pedpro_Quantidade := StrToInt(grdItems.cells[4,iRow]);
      lObjPedidosProdutos.Pedpro_Vlr_Unitario := StrToCurr(grdItems.cells[5,iRow]);
      lObjPedidosProdutos.Pedpro_Vlr_Total := StrToCurr(grdItems.cells[6,iRow]);

      lResposta := lObjCtrlPedidosProdutos.Salvar(lObjPedidosProdutos);

      if lResposta <> '' then
      begin
        fnc_criar_mensagem('SALVA DADOS DE PEDIDOS',
                       'ERRO AO SALVAR OS DADOS DO PEDIDO',
                       lResposta,
                       ExtractFilePath( Application.ExeName ) + '\Icons\Aviso.png',
                       'OK');
      end
      else
      begin
        fnc_criar_mensagem('SALVA DADOS DE PEDIDOS',
                       'DADOS DE PEDIDOS',
                       'Dados do pedido salvos com sucesso!',
                       ExtractFilePath( Application.ExeName ) + '\Icons\Server.png',
                       'OK');
      end;
    finally
      FreeAndNil(lObjPedidosProdutos);
      FreeAndNil(lObjCtrlPedidosProdutos);
      LimpaCampos;
    end;
  end;
end;

procedure TfrmPrincipal.btnInsereProdutoClick(Sender: TObject);
begin
  var lObjPedido: TPedidosDadosGerais;
  var lObjCtrlPedido: TControllerPedidosDadosGerais;
  var iRow: byte;
  var lVlrTotal: currency;

  Inc(lCont);

  grdItems.cells[0,lCont] := IntToStr(lCont);
  grdItems.cells[1,lCont] := edtPedido.Text;
  grdItems.cells[2,lCont] := edtCodProduto.Text;
  grdItems.cells[3,lCont] := edtDescProduto.Text;
  grdItems.cells[4,lCont] := edtQuantidade.Text;
  grdItems.cells[5,lCont] := CurrToStr(lVlrUnitario);
  grdItems.cells[6,lCont] := CurrToStr(lVlrUnitario * StrToCurr(edtQuantidade.Text));

  lVlrTotal := 0;
  for iRow := 1 to lCont do
    lVlrTotal := lVlrTotal + StrToCurr(grdItems.cells[6,iRow]);

  edtTotal.Text := CurrToStr(lVlrTotal);
  grdItems.RowCount := grdItems.RowCount + 1;

  lObjPedido := TPedidosDadosGerais.Create(DataModule1.FDConnection);
  lObjPedido.Pdg_Dt_Emissao := Now;
  lObjPedido.Pdg_Vl_Total := StrToCurr(grdItems.cells[6,lCont]);
  lObjPedido.Id_Clientes := StrToInt(edtCodCliente.Text);
  lObjCtrlPedido := TControllerPedidosDadosGerais.Create;
  lObjCtrlPedido.Salvar(lObjPedido);

  edtCodProduto.Text := '';
  edtDescProduto.Text := '';
  edtQuantidade.Text := '';
  edtCodProduto.SetFocus;
end;

procedure TfrmPrincipal.edtCodClienteExit(Sender: TObject);
begin
  var lObjCliente: TClientes;
  var lObjCtrlClientes: TControllerClientes;
  var lMsgRetorno: string;

  if edtCodCliente.Text = '' then
    Exit;

  lObjCliente:= TClientes.Create(DataModule1.FDConnection);
  lObjCtrlClientes:= TControllerClientes.Create;
  lObjCliente.IdCliente := StrToInt(edtCodCliente.Text);

  if lObjCtrlClientes.GetNome(lObjCliente) = '' then
  begin
    fnc_criar_mensagem('BUSCA DADOS DO CLIENTE',
                       'ERRO AO BUSCAR DADOS DO CLIENTE',
                       'N�o foi poss�vel encontrar o cliente com o c�digo '+
                       edtCodCliente.Text,
                       ExtractFilePath( Application.ExeName ) + '\Icons\Erro.png',
                       'OK');
  end
  else
    edtNomeCliente.Text := lObjCtrlClientes.GetNome(lObjCliente);
end;

procedure TfrmPrincipal.edtCodProdutoExit(Sender: TObject);
begin
  var lObjProduto: TProdutos;
  var lObjCtrlProd: TControllerProdutos;

  if edtCodProduto.Text = '' then
    Exit;

  lObjProduto := TProdutos.Create(DataModule1.FDConnection);
  lObjCtrlProd := TControllerProdutos.Create;
  lObjProduto.IdProduto := StrToInt(edtCodProduto.Text);

  if lObjCtrlProd.GetNome(lObjProduto) = '' then
  begin
    fnc_criar_mensagem('BUSCA DADOS DO PRODUTO',
                       'ERRO AO BUSCAR DADOS DO PRODUTO',
                       'N�o foi poss�vel encontrar o produto com o c�digo '+
                       edtCodCliente.Text,
                       ExtractFilePath( Application.ExeName ) + '\Icons\Erro.png',
                       'OK');
  end
  else
    edtDescProduto.Text := lObjCtrlProd.GetNome(lObjProduto);

  lVlrUnitario := lObjCtrlProd.GetVlrVenda(lObjProduto);
end;

procedure TfrmPrincipal.edtPedidoExit(Sender: TObject);
begin
  var lObjPedido: TPedidosDadosGerais;
  var lObjCtrlPedido: TControllerPedidosDadosGerais;

  if edtPedido.Text = '' then
    Exit;

  lObjPedido := TPedidosDadosGerais.Create(DataModule1.FDConnection);
  lObjCtrlPedido := TControllerPedidosDadosGerais.Create;
  lObjPedido.Id_Ped_Dados_Gerais := StrToInt(edtPedido.Text);
  lObjPedido := lObjCtrlPedido.Buscar(lObjPedido);

  if lObjPedido.Id_Clientes > 0 then
  begin
    edtCodCliente.Text := IntToStr(lObjPedido.Id_Clientes);
    edtCodClienteExit(nil);
    //TODO: Aqui Faltou fazer a procedure para listar os itens do pedido.
    edtCodProduto.SetFocus;
  end
  else
    edtCodCliente.SetFocus;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  lCont := 0;
  grdItems.Cells[0,lCont] := 'Item';
  grdItems.Cells[1,lCont] := 'Pedido';
  grdItems.Cells[2,lCont] := 'C�d. Prod.';
  grdItems.Cells[3,lCont] := 'Produto';
  grdItems.Cells[4,lCont] := 'Quantidade.';
  grdItems.Cells[5,lCont] := 'Vlr. Unit.';
  grdItems.Cells[6,lCont] := 'Vlr. Total';
  edtTotal.Text := '0,00';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPrincipal.LimpaCampos;
begin
  var iRow: byte;

  edtPedido.Text := '';
  edtCodCliente.Text := '';
  edtNomeCliente.Text := '';
  edtCodProduto.Text := '';
  edtDescProduto.Text := '';
  edtQuantidade.Text := '';

  for iRow := 1 to lCont do
  begin
    grdItems.cells[0,iRow].Empty;
    grdItems.cells[1,iRow].Empty;
    grdItems.cells[2,iRow].Empty;
    grdItems.cells[3,iRow].Empty;
    grdItems.cells[4,iRow].Empty;
    grdItems.cells[5,iRow].Empty;
    grdItems.cells[6,iRow].Empty;
  end;

  FormActivate(nil);
end;

end.
