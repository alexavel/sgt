unit U_Grupo_;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_000MdlCrud, Data.DB,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtDlgs,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.Phys, FireDAC.Phys.MySQL, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, U_Classcons, EditTuning ;

type
  TfrmGrupo = class(T_frmModeloCrud)
    gru_codigo: TEdit;
    gru_grupo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupo: TfrmGrupo;

implementation

{$R *.dfm}
initialization
  RegisterClass(TfrmGrupo);
end.
