unit U_GrupoCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_000MdlCrud, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtDlgs,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.Phys, FireDAC.Phys.MySQL, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, EditTuning, U_ClassCons, U_dmEmp ;

type
  TfrmGrupocli = class(T_frmModeloCrud)
    Label1: TLabel;
    Label4: TLabel;
    gcl_nome: TEdit;
    gcl_codigo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupocli: TfrmGrupocli;

implementation

{$R *.dfm}

end.
