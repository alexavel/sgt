unit BEdit;

interface

    uses StdCtrls, Graphics, ExtCtrls, Vcl.Controls, Mask, ComCtrls;

type

    TDateTimePicker     = class(ComCtrls.TDateTimePicker)
    private
        FOldColor: TColor;
    protected
        procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
        procedure DoExit; override;   { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}
    end;


    implementation


procedure TDateTimePicker.DoEnter;
begin
    inherited;
   { Observe a variável/field FOldColor, onde ela guarda a cor anterior  }
    FOldColor := Color;
   { Observe neste ponto dizemos que a cor ao entrar no Edit será clYellow }
    Color := clYellow;

end;

procedure TDateTimePicker.DoExit;
begin
    inherited;
   { Observe a cor agora irá receber o conteúdo da variável/field FOldColor }
    Color := FOldColor;
end;



end.



Leia mais em: Mudar Cor: Edit http://www.devmedia.com.br/mudar-cor-edit/17877#ixzz2ZnzC6nGc
