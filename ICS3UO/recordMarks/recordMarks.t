var student1 :
    record
	name1 : string
	mark1 : int
	mark2 : int
	mark3 : int
	mark4 : int
	mark5 : int
    end record

var student2 :
    record
	name1 : string
	mark1 : int
	mark2 : int
	mark3 : int
	mark4 : int
	mark5 : int
    end record

var student3 :
    record
	name1 : string
	mark1 : int
	mark2 : int
	mark3 : int
	mark4 : int
	mark5 : int
    end record

loop
    exit when eof
    get student1.name1
    get student1.mark1
    get student1.mark2
    get student1.mark3
    get student1.mark4
    get student1.mark5
    put "Name: ", student1.name1, " | Mark 1: ", student1.mark1, " | Mark 2: ", student1.mark2, " | Mark 3: ", student1.mark3, " | Mark 4: ", student1.mark4, " | Mark 5: ", student1.mark5
    put "Average: ", round((student1.mark1 + student1.mark2 + student1.mark3 + student1.mark4 + student1.mark5) / 5)

    put ""

    get student2.name1
    get student2.mark1
    get student2.mark2
    get student2.mark3
    get student2.mark4
    get student2.mark5
    put "Name: ", student2.name1, " | Mark 1: ", student2.mark1, " | Mark 2: ", student2.mark2, " | Mark 3: ", student2.mark3, " | Mark 4: ", student2.mark4, " | Mark 5: ", student2.mark5
    put "Average: ", round((student2.mark1 + student2.mark2 + student2.mark3 + student2.mark4 + student2.mark5) / 5)

    put ""

    get student3.name1
    get student3.mark1
    get student3.mark2
    get student3.mark3
    get student3.mark4
    get student3.mark5
    put "Name: ", student3.name1, " | Mark 1: ", student3.mark1, " | Mark 2: ", student3.mark2, " | Mark 3: ", student3.mark3, " | Mark 4: ", student3.mark4, " | Mark 5: ", student3.mark5
    put "Average: ", round((student3.mark1 + student3.mark2 + student3.mark3 + student3.mark4 + student3.mark5) / 5)
end loop
