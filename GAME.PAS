program rock_paper_scissors;

uses crt;

const moves : array[1..3] of string = ('Rock', 'Paper', 'Scissors');

var input,index:integer;
choice:string;

procedure game;

begin
     TextColor(White);
     clrscr;
     writeln('Choose your move...');
     writeln;
     writeln('1 for Rock...');
     writeln('2 for Paper...');
     writeln('3 for Scissors...');
     writeln;
     repeat
        readln(input);
        if (input > 3) xor (input < 1) then
        begin
             writeln;
             writeln('Invalid value! Try again...');
        end;
        writeln;
     until input in [1..3];

     Randomize;

     repeat
           index := Random(4);
     until index <> 0;

     writeln('You said: ', moves[input]);
     writeln;
     writeln('Computer says: ', moves[index]);
     writeln;

     if index = input then
     begin
          writeln('You drew!');
     end
     else
     begin
         if ((input = 1) and (index = 3)) xor ((input = 2) and (index = 1)) xor ((input = 3) and (index = 2)) then
         begin
            writeln('You won!');
            writeln;
            writeln(moves[input], ' beats ', moves[index]);
        end
        else
        begin
            writeln('You lost!');
            writeln;
            writeln(moves[index], ' beats ', moves[input]);
        end;
     end;

     writeln;

end;

begin
    repeat
        game;
        writeln('Play again? Type "yes" or "no"...');
        repeat
            writeln;
            readln(choice);
        until (choice = 'yes') xor (choice = 'no');
    until choice = 'no';
end.
