unit View.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmMensagens = class(TForm)
    pnlFundo: TPanel;
    shpFundo: TShape;
    Panel1: TPanel;
    lblTituloJanela: TLabel;
    imgIcone: TImage;
    lblTituloMensagem: TLabel;
    lblMensagem: TLabel;
    Panel6: TPanel;
    pnlBtSim: TPanel;
    btnSim: TSpeedButton;
    pnlBtNao: TPanel;
    btnNao: TSpeedButton;
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sTituloJanela, sTituloMsg, sMensagem, sCaminhoIcone, sTipo : string;
    bRespostaMSG : Boolean;
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

procedure TfrmMensagens.btnNaoClick(Sender: TObject);
begin
  bRespostaMSG := False;

  Close;
end;

procedure TfrmMensagens.btnSimClick(Sender: TObject);
begin
  bRespostaMSG := True;

  Close;
end;

procedure TfrmMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnSimClick( Self )
  else if key = VK_ESCAPE then
    btnNaoClick( Self );
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin
  bRespostaMSG := False;

  lblTituloJanela.Caption   := sTituloJanela;
  lblTituloMensagem.Caption := sTituloMsg;
  lblMensagem.Caption       := sMensagem;
  imgIcone.Picture.LoadFromFile( sCaminhoIcone );

  if sTipo = 'OK' then
  begin
    pnlBtNao.Visible := False;
    btnSim.Caption := 'OK ( ENTER )';
  end;
end;

end.
