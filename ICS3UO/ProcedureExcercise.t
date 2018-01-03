var day1: real := 2.0
var day2: int := 7
var name:string := "Doozy"

proc FuncFun(j:int,k: string, var m: real)
    m := m*j
end FuncFun

put"i Name      Day1            Day2                m                   j    k "

for i : 1 .. 5
    FuncFun(day2, name, day1)
    put i ..
    put name: 6 ..
    put day1:10 ..
    put day2: 14 ..
    put day2: 18 ..
    put day1: 22 ..
    put name: 26
    put ""
end for
