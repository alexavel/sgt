unit u_aguarde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
    Taguarde = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FCanClose: Boolean;
  public
    { Public declarations }
    class function ShowWaitForm( Msg : String ): Taguarde;
    procedure AllowClose;
  end;

var
  WaitForm: Taguarde;

implementation

{$R *.dfm}

{ Taguarde }

procedure Taguarde.AllowClose;
begin
  FCanClose := True;
end;

procedure Taguarde.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;
end;

class function Taguarde.ShowWaitForm( Msg : String ): Taguarde;
begin
  Result := Self.Create(Application);
  Result.Show;
  Result.Update;
  { exemplo:

 with Taguarde.ShowWaitForm('') do
     try

        -> Procedimentos

    finally
      AllowClose;
      Free;
    end;



  }
end;

end.
end.
