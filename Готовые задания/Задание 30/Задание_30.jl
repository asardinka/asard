#=
Написать функцию, расставляющие маркеры в шахматном порядке,
начиная с исходной клетки внутри произвольного замкнутого лабиринта,
ограниченного перегородками, и возвращающего робота в исходное положение.
205
Указания
1) воспользоваться рекурсивным алгоритмом обхода поля;
2) спроектировать и использовать робота специального типа, ставящего
маркеры в шахматном порядке
=#

using HorizonSideRobots

include("Struct.jl")


function move_maze!(r, side)
    sides = [Nord, West, Sud, Ost]
    deleteat!(sides, Int(inverse(side))+1)

    for s in sides
        if !isborder(r,s)
            move!(r, s)
            move_maze!(r, s)
            move!(r, inverse(s))
        end 
    end
end



function main(r)
    flag = true

    r = ChessMarkRobot(r, flag)
    move_maze!(r, Nord)
end

r = Robot("maze_small.sit", animate = true)
