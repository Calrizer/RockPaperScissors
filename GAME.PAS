{Rock, Paper, Scissors, a basic Pascal program by Callum Drain}

program rock_paper_scissors;

uses crt;

const moves : array[1..3] of string = ('Rock', 'Paper', 'Scissors'); {Declaration of array of move strings.}

var input,index,test:integer;
choice:string;

procedure game; {Game logic written here, so can be called when repeating the game.}

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
        readln(choice);
        test := 0;
        input := 0;
        val(choice, input, test); {If non integer, test returns '1' to detect invalid input.}
        if (input > 3) xor (input < 1) then
        begin
             writeln;
             writeln('Invalid value! Try again...');
        end;
        writeln;
     until (input in [1..3]) and (test = 0); {Stops iterating when an integer value between 1 and 3 is detected.}

     Randomize;

     index := Random(3) + 1; {Generates random number to get array index.}

     writeln('You said: ', moves[input]);
     writeln;
     writeln('Computer says: ', moves[index]);
     writeln;

     if index = input then {Returns true if both the user imput and random number are the same.}
     begin
          writeln('You drew!');
     end
     else
     begin
         if ((input = 1) and (index = 3)) xor ((input = 2) and (index = 1)) xor ((input = 3) and (index = 2)) then
         {Trys all possible ways of winning, returns true.}
         begin
            writeln('You won!');
            writeln;
            writeln(moves[input], ' beats ', moves[index]);
        end
        else {If above returns false, player has lost.}
        begin
            writeln('You lost!');
            writeln;
            writeln(moves[index], ' beats ', moves[input]);
        end;
     end;

     writeln;

end;

{Start of main class.}

begin
    repeat
        game; {Calls game procedure.}
        writeln('Play again? Type "yes" or "no"...');
        repeat
            writeln;
            readln(choice);
        until (choice = 'yes') xor (choice = 'no'); {Iterates until the input is 'yes' or 'no'.}
    until choice = 'no'; {Stops interating if the input is 'no'.}
end.
