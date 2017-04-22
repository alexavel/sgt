unit EditTuning;

interface

    uses vcl.StdCtrls, vcl.Graphics, vcl.ExtCtrls, Vcl.Controls, Mask ;

type

    TEdit       = class(vcl.StdCtrls.TEdit)
    private
        FOldColor: TColor;
        procedure AfterConstruction; override;
        procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
        procedure DoExit; override;  { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}
    public
    Published
//        property Color default clGradientInactiveCaption ;
    end;

type

    TButtonedEdit     = class(vcl.ExtCtrls.TButtonedEdit)
    private
        FOldColor: TColor;
    protected
        procedure AfterConstruction; override;
        procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
        procedure DoExit; override;   { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}
    end;

type

    TMaskEdit     = class(vcl.Mask.TMaskEdit)
    private
        FOldColor: TColor;
    protected
        procedure AfterConstruction; override;
        procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
        procedure DoExit; override;   { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}
    end;


implementation
 Uses U_Funcao;
{ TEdit }
const
  COLOR_CONS = $00DFFFFF;
  COLOR_GETS = clGradientInactiveCaption;
  COLOR_FONT = clBlack;


procedure TEdit.DoEnter;
begin
    inherited;
   { Observe a variável/field FOldColor, onde ela guarda a cor anterior  }
    FOldColor   := COLOR_CONS;
   { Observe neste ponto dizemos que a cor ao entrar no Edit será clYellow }
    Color       := COLOR_GETS;
    Font.Color  := COLOR_FONT;

end;

procedure TEdit.DoExit;
begin
    inherited;
   { Observe a cor agora irá receber o conteúdo da variável/field FOldColor }
    Color := COLOR_CONS;
    Font.Color := COLOR_FONT;
end;

procedure TEdit.AfterConstruction;
begin
  inherited;
  Self.Color := COLOR_CONS;
  Self.Font.Color := COLOR_FONT;
end;


// Metodos do ButtonEdit
procedure TButtonedEdit.DoEnter;
begin
    inherited;
   { Observe a variável/field FOldColor, onde ela guarda a cor anterior  }
    FOldColor := COLOR_CONS;
   { Observe neste ponto dizemos que a cor ao entrar no Edit será clYellow }
    Color := COLOR_GETS;
    Font.Color := COLOR_FONT;

end;

procedure TButtonedEdit.DoExit;
begin
    inherited;
   { Observe a cor agora irá receber o conteúdo da variável/field FOldColor }
    Color := COLOR_CONS;
    Font.Color := COLOR_FONT;
end;

procedure TButtonedEdit.AfterConstruction;
begin
  inherited;
  Self.Color := COLOR_CONS;
  Self.Font.Color := COLOR_FONT;
end;

// Metodos do TMaskEditt
procedure TMaskEdit.DoEnter;
begin
    inherited;
   { Observe a variável/field FOldColor, onde ela guarda a cor anterior  }
    FOldColor := COLOR_CONS;
   { Observe neste ponto dizemos que a cor ao entrar no Edit será clYellow }
    Color := COLOR_GETS;
    Font.Color := COLOR_FONT;

end;

procedure TMaskEdit.DoExit;
begin
    inherited;
   { Observe a cor agora irá receber o conteúdo da variável/field FOldColor }
    Color := COLOR_CONS;
    Font.Color := COLOR_FONT;
end;

procedure TMaskEdit.AfterConstruction;
begin
  inherited;
  Self.Color := COLOR_CONS;
  Self.Font.Color := COLOR_FONT;
end;

end.


