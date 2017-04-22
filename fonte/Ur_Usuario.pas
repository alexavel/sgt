unit Ur_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxIBXComponents, StdCtrls, frxDBSet, frxClass;

type
  TfrmRel = class(TForm)
    Button1: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel: TfrmRel;

implementation

uses U_dm;

{$R *.dfm}
procedure TfrmRel.Button1Click(Sender: TObject);
begin
   //RLReport1.Preview();
 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'reports\rel_usuario.fr3');
 frxReport1.ShowReport();

end;

procedure TfrmRel.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  dm.ibqUsuario.Open;
end;

initialization
//RLConsts.SetVersion(3,71,'B');
end.
