#=
 Написать рекурсивную функцию, перемещающую робота в позицию,
симметричную по отношению к перегородке, находящейся с заданного
направления, т.е. требуется, чтобы в результате робот оказался на расстоянии от
противоположной перегородки равном расстоянию до заданной перегородки.
=#

using HorizonSideRobots

include("librobot.jl")

function border_move!(r, side)
    if !isborder(r, side)
        move!(r, side)
    else
        move!(r, right(side))
        border_move!(r, side)
        move!(r, left(side))   
    end 
end


r = Robot("Peregorodka.sit", animate = true) 