%William King 529789
%Programmed Date: May 1, 2017
%Ms. Sajan ICS 3UO

%This program is a lottery based game that has the user pick 6 unique integers from 1-49.
%Using procedures and arrays, these 6 integers are sorted and compared to another sorted/
%shuffled list of 6 computer selected numbers. The user is rewarded money based off of
%how many user selected numbers match computer selected numbers.

%--------------------------------START OF PROGRAM----------------------------------------
%---------------------------GLOBAL VARIABLES (PROCEDURAL)--------------------------------
%Declare the 6 variables below as 4 integer arrays and 2 integers respectively;
%they are above the mainline as they are accessed by multiple procedures.
var userSelection : array 1 .. 6 of int 
var winningSelection : array 1 .. 6 of int
var possibleSelection : flexible array 1 .. 0 of int
var shuffledSelection : array 1 .. 49 of int
var matchingSelections : flexible array 1 .. 0 of int

var money : int := 1
var count : int := 0

%-----------------------------------USERPICKS--------------------------------------------
proc userPicks                                                  %Procedures lets the user
    var numberSelection : int                                   %pick 6 unique integers
    var exitCondition : boolean                                 %from 1-49 to play.
    put "Select 6 unique integers from 1 - 49."
    
    for i : 1 .. 6
	loop                                                    %The user can only pick
	    exitCondition := true                               %the next number when
	    put ""                                              %conditions are met
								%(between 1-49 and not
	    get numberSelection                                 %already selected).
	    
	    if numberSelection > 0 and numberSelection < 50 then
		for j : 1 .. 6
		    if numberSelection = userSelection (j) then
			put "You already picked that number!"..
			put " Please pick a different number."
			exitCondition := false
			exit
		    end if
		end for

		if exitCondition = true then
		    userSelection (i) := numberSelection        %Once the user picks a 
		    exit                                        %valid number it is 
		end if                                          %stored in the array
								%holding the user
								%selected numbers.
	    else
		put "That's not a valid number! Please pick an integer from 1 to 49."
	    end if
	end loop
    end for
end userPicks

%-----------------------------------COMPSHUFFLE------------------------------------------
proc compShuffle                                                %An array of numbers 1-49
    var random : int                                            %are randomly shuffled. 
    for i : 1 .. 50                                             %The procedure exchanges
	loop                                                    %a longer run time for
								%a more random outcome as
								%well as to simulate a
								%real lottery number draw 
	    for j : 1 .. 49                                     
		randint (random, 1, upper (possibleSelection))  %A number is randomly
								%generated to select an
								%index from the existing
								%array and stores it in
								%the first available slot
								%in a new array.
		shuffledSelection (j) := possibleSelection (random)
		for k : random + 1 .. upper (possibleSelection)
		    possibleSelection (k - 1) := possibleSelection (k)
		end for
		
		new possibleSelection, upper (possibleSelection) - 1
								%When a number is stored,
								%it is removed from the
								%original array, which
								%prevents duplicates.
								%(shifts values to the
								%right of the index
								%one space to the left)
	    end for
	    exit when upper (shuffledSelection) = 49            %This is done 49 times,
								%then repeated 3 more 
								%times.
	end loop
	for j : 1 .. 49
	    new possibleSelection, upper (possibleSelection) + 1
	    possibleSelection (j) := shuffledSelection (j)
	end for
    end for
end compShuffle

%-----------------------------------------WINNUM-----------------------------------------
proc winNum                                                     %Procedure takes the
    for i : 1 .. 6                                              %first 6 numbers in the
	winningSelection (i) := shuffledSelection (i)           %shuffled array and 
    end for                                                     %stores them in the array
end winNum                                                      %storing the winning #s.
								%The array was heavily
								%shuffled before so the
								%selection is random.

%----------------------------------------NUMSORT-----------------------------------------
proc numSort (var a : array 1 .. 6 of int)                      %Procedure sorts the 
    var storedNum : int                                         %passed in array from
    for i : 1 .. 6                                              %least to greatest,
	for j : 2 .. 6                                          %swapping numbers where
	    if a (j - 1) > a (j) then                           %needed using a storage
		storedNum := a (j - 1)                          %variable. All arrays
		a (j - 1) := a (j)                              %passed in are meant to 
		a (j) := storedNum                              %have 6 indexes only.
	    end if
	end for
    end for
end numSort

%--------------------------------------COMPARENUM----------------------------------------
proc compareNum (var a : array 1 .. 6 of int, 
    var b : array 1 .. 6 of int, var match : int) 
								%Procedure checks for
    for i : 1 .. 6                                              %any elements in the two
	for j : 1 .. 6                                          %passed in arrays that
	    if a (i) = b (j) then                               %have the same values,
								%increasing a count var.
		new matchingSelections, upper(matchingSelections) + 1
		matchingSelections(upper(matchingSelections)) := a(i)
		match += 1                                      
	    end if
	end for
    end for
end compareNum

%---------------------------------------DISPLAY------------------------------------------
proc display (match : int) %uses a value parameter
    var winnings : int := 0
    put "Your number selection and the computer generated selection will be displayed."
    put " _________________________________________________"
    put "|Your selection: | ", userSelection(1) : 5..           %Procedure displays the 
    put userSelection(2) : 5, userSelection(3) : 5..            %user selected #s and the
    put userSelection(4) : 5, userSelection(5) : 5..            %computer selected #s in
    put userSelection(6) : 5, " |"                              %their sorted form.
    put "|Comp selection: | ", winningSelection(1) : 5, winningSelection(2) : 5..
    put winningSelection(3) : 5, winningSelection(4) : 5, winningSelection(5) : 5 ..
    put winningSelection(6) : 5, " |"
    put "|_________________________________________________|"
    put ""
    put "Matches: "
    if upper(matchingSelections) > 0 then
	for i : 1 .. upper(matchingSelections)
	    put matchingSelections(i)
	end for
    else
	put "None"
    end if
    
    put ""
    put "Your winnings are calculated based off of the following table:"
    put " _________________________"
    put "|One Match: $10           |"
    put "|Two Matches: $100        |"
    put "|Three Matches: $1,000    |"
    put "|Four Matches: $1,600,000 |"
    put "|Five Matches: $3,200,000 |"
    put "|Six Matches: $6,400,000  |"
    put "|_________________________|"
								
    if match < 4 and match > 0 then                             %Based off of the amount
	winnings += 10 ** match                                 %of numbers that match up
    elsif match > 3 then                                        %the round's winnings are
	winnings += 100000 * (2 ** match)                       %calculated and displayed
    end if

    put ""
    put "You won $", winnings, "!"
    money += winnings
end display

%------------------------------------------RESET-----------------------------------------
proc reset                                                      %Additional procedure
    for i : 1 .. 6                                              %created to reset values
	userSelection(i) := 0                                   %for additional rounds.
    end for                                                     %The user selection is 
								%initialized to 0 for
								%each element.
    count := 0                                                  %count is also set to 0
    
    for i : 1 .. upper(matchingSelections)
	new matchingSelections, upper(matchingSelections) - 1
    end for
end reset

%------------------------------------MAIN LINE-------------------------------------------
%Variables not used in procedures are declared here (reply)
var reply : string
setscreen ("graphics:1200;600")

%Informs the user of the game, how to play, and how to win
put "Welcome to WoodsLotto649! This round's 6 lucky numbers have been chosen."
put "Test your luck for $1 and pick 6 unique integers between 1 and 49." ..
put " If you get 1-3 picks right, you will win 10 to the power of n dollars,"
put "and if you get 4-6 picks right, you will win 100,000 times 2 to the " ..
put "power of n dollars, where n is the number of correct picks."
put ""
put "Here you can see how much you can win!"
put " _________________________"
put "|One Match: $10           |"
put "|Two Matches: $100        |"
put "|Three Matches: $1,000    |"
put "|Four Matches: $1,600,000 |"
put "|Five Matches: $3,200,000 |"
put "|Six Matches: $6,400,000  |"
put "|_________________________|"

for i : 1 .. 49                                                 %one time setup for the
    new possibleSelection, upper (possibleSelection) + 1        %compshuffle procedure
    possibleSelection (i) := i
end for

loop
    reset
    put ""
    put "You have $", money, "."
    put "Would you like to play? Type 'yes' if you want to play, " ..
    put "and 'no' if you want to leave."
    get reply
    exit when reply = "no" or reply = "No"                      
    if reply = "yes" or reply = "Yes" and money > 0 then
	cls
	money -= 1
	put "That will be $1! You now have $", money, "."
	compShuffle
	winNum
	numSort (winningSelection)
	userPicks                                               %procedures are called;
	numSort (userSelection)                                 %some procedures are 
	cls                                                     %repeated but different
								%arrays are passed in.
	compareNum (winningSelection, userSelection, count)
	display(count)
	exit when money < 1                                     %another exit statement
								%makes the user exit if
								%they lost all their $.
    else
	put "I did not understand. Please type 'yes' or 'no'."
    end if
end loop


%Puts exit statements and ends the program
if money < 1 then
    put ""
    put "You do not have any money to play! Come back when you have money."
    put ""
    put "You ended up winning a total of $", money, "!"
    put "Thanks for playing!"
else
    put "Goodbye!"
end if

%--------------------------------------END OF PROGRAM------------------------------------
