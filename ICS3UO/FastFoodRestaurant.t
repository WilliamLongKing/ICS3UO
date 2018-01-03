%William King
%Fast Food Restaurant Program
%ICS 3UO | Ms. Sajan
%Programmed Date: March 22, 2017
%This program will allow a customer to order food from the Shell Shack from a given
%menu, and receive a detailed receipt regarding their purchase.

%-----------------------------START OF PROGRAM----------------------------------------
%declare the below 5 variables as various types (string, int, real)
var order : string
var item, i : int := 0
var subtotal, total : real := 0

%declare the below 4 variables as array types
var menu : array 1 .. 14 of string := init(             %Array stores the menu options
"French Fries", "Seafood Poutine", "Calamari Rings",    %The indexes of the menu array
"Garden Salad", "Seafood Burger", "Hamburger","Hot Dog",%and the indexes of the price
"Lobster Roll", "Ice Cream Cone", "Banana Split",       %array match up (e.g. french 
"Apple Pie", "Fountain Drink","Coffee", "Milkshake")    %fries is $3)
var prices : array 1 .. 14 of int := init (3,           %Array stores the item prices
 6, 5, 4, 7, 5, 5, 13, 3, 5, 3, 2, 2, 4)
var selection : flexible array 1 .. 0 of string         %Array stores the ordered items
var selectionPrices : flexible array 1 .. 0 of int      %Array stores ^^ prices

%below put statements inform the user of the menu
setscreen("graphics:1500;1000")
put "Welcome to the Shell Shack! Based on Ingonish".. 
put " Beach in Cape Breton, Nova Scotia,"..
put "we are here to satisfy your food needs! ".. 
put "Here is what we have to offer:"
put ""
put "Appetizers:"
put "French Fries (1) $3, Seafood Poutine (2) $6,"..
put "Calamari Rings (3) $5, Garden Salad (4) $4"
put ""
put "Entrees:" 
put "Seafood Burger (5) $7, Hamburger (6) $5,"..
put "Hot Dog (7) $5, Lobster Roll (8) $13"
put ""
put "Desserts:" 
put "Ice Cream Cone (9) $3, Banana Split (10) $5,"..
put "Apple Pie (11) $3"
put ""
put "Drinks:"
put "Fountain Drink (12) $2, Coffee (13) $2,"..
put "Milkshake (14) $4"
put ""
put "Would you like to order something?" 
put "Type 'yes' for yes, or type 'no' for no."
put "Type 'menu' at any time to see the menu."

%below loop allows the user to order as many items as wanted until they want to stop
loop
    get order
    exit when order = "no" or order = "No"              %User quits when they are done
    if order = "yes" or order = "Yes" then
	put "Use the numbered system to order (e.g."
	put "type '1' to order french fries for $3.)"
	
	new selection, upper (selection)+1              %Dynamic arrays are used so
	new selectionPrices, upper(selectionPrices)+1   %the array is only as long
	get item                                        %as it needs to be.
	
	i += 1                                          %A for loop is not used here
							%as we are ordering items
							%individually and do not know
							%how many items the user will
							%order.
							
	selection(i) := menu(item)                      %Depending on what the user
	selectionPrices(i) := prices(item)              %ordered, the item and its
	subtotal += prices(item)                        %price are stored in arrays
							%to be printed out later.
							%The price is added to a
							%subtotal variable.
	
	put "You have ordered ", selection(i)
	put "for $", selectionPrices(i), "!"
	put "Would you like to order something else?" 
	put "Type 'yes' or 'no', or 'menu' to see the menu."
    elsif order = "menu" then
	put "Appetizers:"
	put "French Fries (1) $3, Seafood Poutine (2) $6,"
	put "Calamari Rings (3) $5, Garden Salad (4) $4"
	put ""
	put "Entrees:" 
	put "Seafood Burger (5) $7, Hamburger (6) $5,"
	put "Hot Dog (7) $5, Lobster Roll (8) $13"
	put ""
	put "Desserts:" 
	put "Ice Cream Cone (9) $3, Banana Split (10) $5,"
	put "Apple Pie (11) $3"
	put ""
	put "Drinks:"
	put "Fountain Drink (12) $2, Coffee (13) $2,"
	put "Milkshake (14) $4"
	put ""
	put "Would you like to order something?" 
	put "Type 'yes' for yes, or type 'no' for no."
	put "Type 'menu' at any time to see the menu."
    else
	put "Sorry, I did not understand." 
	put "Please type 'yes' or 'no'."
    end if
end loop

%below lines give the user their receipt when finished.
put ""
put "Here is your order:"
for x : 1 .. upper(selection)
    put selection(x), ": $", selectionPrices(x)         %prints out each item ordered
end for                                                 %and ther price

put ""
put "Your subtotal comes to $", subtotal, "."           %calculates tax
put "The tax rate is 13% here."
total := subtotal * 1.13
put "Your total comes to $", total, "."                 %prints total

put ""
put "Thank you for choosing Shell Shack!"
put "We hope to see you soon."
%-------------------------------------END OF PROGRAM----------------------------------
