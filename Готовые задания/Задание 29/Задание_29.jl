#=
Написать функцию, расставляющие маркеры в каждой клетке внутри
произвольного замкнутого лабиринта, ограниченного
а) маркерами,
б) перегородками,
и возвращающую робота в исходное положение.
Указание: воспользоваться рекурсией.
=#

using HorizonSideRobots

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))
mark_lab!(r)=
if !ismarker(r)
    putmarker!(r)
    for s in (Nord, West, Sud, Ost)
        move!(r, s)
        mark_lab!(r)
        move!(r, inverse(s))
    end
end

#r = Robot("mark_labirint.sit", animate = true) #labirint_2.sit, maze.sit

mark_maze!(r)=
if !ismarker(r)
    putmarker!(r)
    for s in (Nord, West, Sud, Ost)
        if !isborder(r,s)
            move!(r, s)
            mark_maze!(r)
            move!(r, inverse(s))
        end 
    end
end

#r = Robot("maze.sit", animate = true) # maze_2.sit