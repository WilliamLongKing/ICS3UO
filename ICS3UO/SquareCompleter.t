%William King
%June 14, 2017
%Completing the Square Program

%This program is designed to complete the square of a given
%quadratic equation in standard form to find the vertex of the equation.

%--------------------------------------START OF PRGORAM----------------------------------

%-------------------------------------factor PROCEDURE-----------------------------------
proc factor (num1 : real, num2 : real, num3 : real,
	var factored2 : real)

    put "The first step to completing the square is to factor out the coefficient a "
    put "from the first two terms (that contain x)."
    put ""
    
    put "By factoring now, we make it easier to find the square so that we do not have"
    put "to factor in the middle of another step. "
    put "The constant term does not need to be factored."
    put ""

    put "Factoring out the coefficient ", num1, ", we get the equation below:"
    put "y = ", num1, "((", num1, "/", num1, ") x**2 + (", num2, "/", num1, ")x) + ("..
    put num3, ")"

    factored2 := num2 / num1
    
    put "  = ", num1, "(x**2 + (", factored2, ")x) + (", num3, ")"
    put ""

    put "Having factored the equation, we are now ready to continue!"
    put ""
    put "-------------------------------------------------------------------------------"

end factor

%-----------------------------------formSquare PROCEDURE---------------------------------
proc formSquare (num1 : real, num2 : real, num3 : real, var hValue : real)
    put "The second step to completing the square is to determine what 'h' would be in"
    put "the vertex form. This will give you the x-coordinate for the vertex."
    put ""

    put "The perfect square form is a**2 + 2ab + b**2, or (a+b)**2 when factored."
    put "This is the form that will be created as part of the solution."
    put ""
    
    put "The factored value for b is ", num2, ". By using this value, the constant term"
    put "that would complete the square can be determined."
    put "2b = ", num2, " (this is because a has already been factored out."
    put ""
    
    put "To find the value of b, divide by 2, which is ", 2 * num1, "."
    hValue := num2 / 2
    put "Therefore, the value of b is ", num2, "/", 2 * num1, ", which is ", hValue, "."
    put ""

    put "Now that we have this value, we can substitute it as b while"
    put "substituting a as x to get the perfect square (x + (", hValue, "))**2."
    put ""

    put "This form appears in the vertex form and is the first part of our solution!"
    put "This means we have already solved for the value of h, which is ", hValue, "."
    put ""
    put "-------------------------------------------------------------------------------"
end formSquare

%---------------------------------PERFECT SQUARE PROCEDURE-------------------------------
proc modifyConstant (a, factored2, factored3 : real, hValue : real)
    put "We have found the value of h by creating the perfect square form for it,"
    put "but now we need to modify the standard form equation to incorporate this."
    put ""
    
    put "We can do this by adding and subtracting the value of h**2 from the equation"
    put "within the perfect square such that it can be formed."
    put ""
    
    put "In this case, add and subtract the value of ", hValue, "**2, or "..
    put hValue ** 2, " to the equation."
    put "By adding and subtracting the same value, the equation is unaffected:."
    put "y = ((", a, ")x**2 + (", factored2, ")x  + (", hValue ** 2 ..
    put ") - (", hValue ** 2, ")) + (", factored3, ")"
    put ""
    
    put "The added term can now be used to form the perfect square,"
    put "while the negative added term can be factored out of the equation."
    put "y = (", a, ")(x + (", hValue, "))**2 + ", factored3, " - (",a..
    put " x ", hValue ** 2, ")"
    put "  = (", a, ")(x + (", hValue, "))**2 + ", factored3, " - (",a * hValue ** 2, ")"
    put ""
    
    put "The terms within the first set of brackets (", a, ")x**2, (", factored2, ")x,"
    put "and (", hValue ** 2, ") were combined together to form the perfect square,"
    put "while (-", hValue ** 2, ") was factored out, "..
    put "such that a perfect square could be formed."
    put ""
    
    put "-------------------------------------------------------------------------------"
    put "Now, like terms can be collected to create a final, simplified answer."
    put "y = (", a, ")(x + (", hValue, "))**2 + ", factored3, " - (", a * hValue ** 2, ")"
    put "  = (", a, ")(x + (", hValue, "))**2 + ", factored3 - ( a * hValue ** 2)
    put ""
    
    put "Using the vertex form, the vertex can be determined to be (", -1 * hValue ..
    put ", ", factored3 - (hValue ** 2), ")!"
    put ""
end modifyConstant

%-----------------------------------CLEAR SCREEN PROCEDURE-------------------------------
proc clearScreen
    var delayChar : string
    put "Enter any key to clear the screen and to continue..."
    get delayChar
    cls
end clearScreen

%-----------------------------------------MAIN LINE--------------------------------------
var a, b, c, factoredB, xCoordinate : real
var reply : string
setscreen ("graphics:700;646")
loop
    cls
    put "This program will help you complete the square for a given quadratic equation!"
    put "It will convert from the standard form (ax**2 + bx + c)"
    put "to the vertex form (a(x-h)**2 + k"
    put "(Note that ** is equivalent to 'to the power of'."
    put ""
    put "Input the values of a, b, and c from your standard for equation to solve."
    put "Please use the respective signs of numbers! For example:"
    put "In the quadratic equation y = 5x**2 -5x - 3, a = 5, b = -5, and c = -3."
    put ""

    put "What is the value of a?"
    get a
    put "What is the value of b?"
    get b
    put "What is the value of c?"
    get c

    cls
    put "The square will be completed for the following equation:"
    put "y = (", a, ")x**2 + (", b, ")x + (", c, ")."
    put ""
    put "-------------------------------------------------------------------------------"

    factor (a, b, c, factoredB)
    formSquare (a, factoredB, c, xCoordinate)
    clearScreen
    modifyConstant (a, factoredB, c, xCoordinate)

    put "Would you like to complete the square for another equation?"
    put "Type 'n' if you would like to quit, and any other character to continue."
    get reply
    exit when reply = "n" or reply = "N"
end loop

cls
put "Thank you for using the complete the square program!"
