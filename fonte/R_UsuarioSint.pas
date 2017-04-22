unit R_UsuarioSint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, ZDataset,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, Datasnap.DBClient,
  Datasnap.Provider;

type
  TfrmRUsuarioSint = class(TForm)
    frxVendas: TfrxReport;
    GroupBox1: TGroupBox;
    Button1: TButton;
    sqlMovIngre: TZQuery;
    sqlMovIngremvi_codigo: TWideStringField;
    sqlMovIngremvi_nmevent: TWideStringField;
    sqlMovIngremvi_cdbarra: TWideStringField;
    sqlMovIngremvi_nrcard: TWideStringField;
    sqlMovIngremvi_imgtop: TWideStringField;
    sqlMovIngremvi_imgbot: TWideStringField;
    sqlMovIngremvi_locevnt: TWideStringField;
    sqlMovIngremvi_horevnt: TWideStringField;
    sqlMovIngremvi_datevnt: TDateField;
    sqlMovIngremvi_taxevnt: TFloatField;
    sqlMovIngremvi_vlrevnt: TFloatField;
    sqlMovIngremvi_strevnt: TWideStringField;
    sqlMovIngremvi_lotevnt: TWideStringField;
    sqlMovIngremvi_usuinc: TWideStringField;
    sqlMovIngremvi_datinc: TDateField;
    sqlMovIngremvi_horinc: TWideStringField;
    sqlMovIngremvi_usualt: TWideStringField;
    sqlMovIngremvi_datalt: TDateField;
    sqlMovIngremvi_horalt: TWideStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRUsuarioSint: TfrmRUsuarioSint;

implementation

{$R *.dfm}

uses U_dmEmp;

procedure TfrmRUsuarioSint.Button1Click(Sender: TObject);
Var
Sqlz : TZQuery;
begin
  // Gerando os Turnos
  {
  zqVendas.Close;
  zqVendas.SQL.Clear;
  zqVendas.SQL.Text :=  ' select * from "99999999999999_FARMA".movingresso';
  zqVendas.Open;
  frxVendas.DesignReport();
  frxVendas.ShowReport();
   }
end;

end.
