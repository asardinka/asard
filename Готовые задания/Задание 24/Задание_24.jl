#=
Написать рекурсивную функцию, перемещающую робота на расстояние
от перегородки с заданного направления вдвое меньшее исходного.
Указание: воспользоваться косвенной рекурсией.
=#

using HorizonSideRobots

include("librobot.jl")

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))

function go_move!(r, side)
    if !isborder(r,side)
        move!(r, side)
        start_move!(r, side) 
        move!(r, inverse(side))
    end
end

start_move!(r, side) = 
if !isborder(r, side)
    move!(r, side)
    go_move!(r,side)
end

r = Robot(animate = true) 