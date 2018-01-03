%William King
%Programmed Date: April 5, 2017
%Ms. Sajan
%ICS 3UO

%This program is designed to award the user $10 (virtually)
%when they roll a fair six sided dice and get a 5 or a 6.

%----------------------------------START OF PROGRAM---------------------------------------
%Declare the below two variables as int and string.
var value : int
var reply : string

%Informing the user
put "Welcome to the dice roll game! Roll a die, and if you roll a 5 or a 6, you win $10!"
put "Would you like to play? Type 'yes' for yes or 'no' for 'no'."

loop
    put ""
    get reply
    exit when reply = "no" or reply = "No"
    if reply = "yes" or reply = "Yes" then
	randint (value, 1, 6)                   %generates a random number between 1 and 6
	put "You rolled a ", value, "!"
	if value > 4 then                       %checks for the win condition
	    put "You win!"
	else
	    put "You lose."
	end if
    end if
    put ""
    put "Would you like to play again? Type 'yes' to play again or 'no' to quit."
end loop
put ""
put "Thanks for playing!"
