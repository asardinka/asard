#=
Написать рекурсивную функцию, перемещающую робота до упора в
заданном направлении, ставящую возле перегородки маркер и возвращающую
робота в исходное положение.
=#

using HorizonSideRobots

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))

function move_mark_end(r, side)
    if isborder(r, side)
        putmarker!(r)
        return 
    end

    move!(r, side)
    move_mark_end(r, side)
    move!(r, inverse(side))
end