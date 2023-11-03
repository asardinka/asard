#=
Написать рекурсивную функцию, перемещающую робота в заданном
направлении до упора и расставляющую маркеры в шахматном порядке,
a) начиная с установки маркера;
б) начиная без установки маркера (в стартовой клетке).
=#

using HorizonSideRobots

include("librobot.jl")

function marker_begin!(r, side)
    putmarker!(r)
    if !isborder(r,side)
        move!(r, side)
        pass_begin!(r, side) 
    end
end

pass_begin!(r, side) = 
if !isborder(r, side)
    move!(r, side)
    marker_begin!(r,side)
end

r = Robot(animate = true) 