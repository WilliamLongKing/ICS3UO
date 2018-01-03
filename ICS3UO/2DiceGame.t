%William King
%Programmed Date: April 7, 2017
%Ms. Sajan
%ICS 3UO

%This program is designed to award the user $10 (virtually)
%when they roll a two fair six sided dice and get a sum above 8,
%and $8 for a sum below 4. Any other result leads to a $2 loss.
%The user pays $3 to play a game, consisting of 5 rolls.

%----------------------------------START OF PROGRAM---------------------------------------
%Declare the below variables as int, string, and array.
var value, rollValue, roundCount : int := 0
var count : int := 3
var reply : string

var rolls : array 1 .. 2, 1 .. 5 of int             %Two dimensional array is used:
						    %Each row represents a die and each
						    %column represents a round of rolling.
var totals : array 1 .. 5 of int := init(0, 0, 0, 0, 0)

setscreen ("graphics:700;450")
%Informing the user

put "Welcome to the dice roll game! Roll two die, and if you roll a 9 or above," ..
put " you win $10!" 
put "If you roll a 3 or below, you win $8! Otherwise, you lose $2."
put "It costs $3 for 5 rolls, but we will give you $3 for your first game."
put "Right now you have $", count, ". Do you want to play?".. 
put " Type 'yes' for yes or 'no' for 'no'."

loop
    put ""
    get reply                                       %Can't play without $3 entry fee
    exit when reply = "no" or reply = "No" or count < 3
    
    if reply = "yes" or reply = "Yes" and count > 0 then
	count -= 3
	put "The screen will be cleared to prepare the game. Please wait 3 seconds."
	roundCount := 0
	delay (3000)
	cls
	put "The game costs you $3. You now have $", count.. 
	put ". The 2 dice will be rolled 5 times."
	
	for i : 1 .. 5
	    for j : 1 .. 2
		randint (rolls (j, i), 1, 6)        %generates random number from 1-6
	    end for                                 %and stores it in the rolls array
	end for                                     %going through each die, then 
						    %repeating 4 more times.                             
	put "Here are your 5 rolls:"
	put ""
	for i : 1 .. 5                              %displays each roll in the array
	    totals(i) := rolls(1, i) + rolls(2, i)  %stores the sum of the rolls in
						    %a separate array
	    delay (500)
	    put "You rolled ", rolls (1, i), " and ", rolls (2, i), "! " ..
	    put "These rolls add up to ", totals (i), "."
	    
	    if totals (i) > 8 then                  %checks to see if user won
		put "You win $10 for this roll!"
		count += 10                         %adds to a total of money won
		roundCount += 10
	    elsif totals (i) < 4 then               %above repeats with different
		put "You win $8 for this roll!"     %win/lose conditions and $ won/lost
		count += 8
		roundCount += 8
	    else
		put "You lose $2 for this roll."
		count -= 2
		roundCount -= 2
	    end if
	    put ""
	end for
	
	put ""                                      %displays money won this round
	put "This round, you won $", roundCount, " dollars!"
	put "Since playing, you have won $" ..      %displays money won so far
	put count, " dollars (subtracting game fees)!"
	put ""
	put "Would you like to play again? Type 'yes' to play again or 'no' to quit."
    else
	put "Sorry, I did not understand."
    end if
end loop

cls

if count < 3 and reply = "yes" or reply ="Yes" then %prevents user from playing unless 
						    %they have $3.
    put "You don't have money to play the game anymore. Come back when you have money!"
elsif totals(1) not= 0 then
    put "You won $", count, "!"
    put ""
end if

put "Thanks for playing!"
%--------------------------------------END OF PROGRAM-------------------------------------
