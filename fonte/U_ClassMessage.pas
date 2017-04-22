unit U_ClassMessage;

interface

type
  TMessageBox_ = record
  private
    FFlags: Integer;
    procedure AddFlag(Flag: Integer);
  public
    class function Create: TMessageBox_; static;

    // Botões
    function OK: TMessageBox_;
    function YesNo: TMessageBox_;
    function YesButtonDefault: TMessageBox_;
    function NoButtonDefault: TMessageBox_;

    // Ícones
    function Information: TMessageBox_;
    function Exclamation: TMessageBox_;
    function Error: TMessageBox_;

    function Show(const Msg, Title: string): Integer;
  end;

function MessageBox_: TMessageBox_;

implementation

uses
  Winapi.Windows,
  Vcl.Forms;

function MessageBox_: TMessageBox_;
begin
  Result := TMessageBox_.Create();
end;

{ TMessageBox_ }

procedure TMessageBox_.AddFlag(Flag: Integer);
begin
  FFlags := FFlags or Flag;
end;

class function TMessageBox_.Create: TMessageBox_;
begin
  Result.FFlags := 0;
end;

function TMessageBox_.Error: TMessageBox_;
begin
  AddFlag(MB_ICONERROR);
  Result := Self;
end;

function TMessageBox_.Exclamation: TMessageBox_;
begin
  AddFlag(MB_ICONEXCLAMATION);
  Result := Self;
end;

function TMessageBox_.Information: TMessageBox_;
begin
  AddFlag(MB_ICONINFORMATION);
  Result := Self;
end;

function TMessageBox_.NoButtonDefault: TMessageBox_;
begin
  AddFlag(MB_DEFBUTTON2);
  Result := Self;
end;

function TMessageBox_.OK: TMessageBox_;
begin
  AddFlag(MB_OK);
  Result := Self;
end;

function TMessageBox_.Show(const Msg, Title: string): Integer;
begin
  Result := Application.MessageBox(PChar(Msg), PChar(Title), FFlags);
end;

function TMessageBox_.YesButtonDefault: TMessageBox_;
begin
  AddFlag(MB_DEFBUTTON1);
  Result := Self;
end;

function TMessageBox_.YesNo: TMessageBox_;
begin
  AddFlag(MB_YESNO);
  Result := Self;
end;

end.
