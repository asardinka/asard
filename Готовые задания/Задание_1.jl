#=
ДАНО: Робот находится в произвольной клетке ограниченного
прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из
маркеров, расставленных вплоть до внешней рамки
=#

using HorizonSideRobots

include("Functions.jl")

function Plus()
    r = Robot("map_1.sit";animate=true)

    for Side in (Nord, Ost, Sud, West)
        full_move!(r,Side; mark = true, rev = true)
    end

    sleep(300)  
end

Plus()