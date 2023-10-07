#=
ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок
и маркеров)
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру
внешней рамки промаркированы.
=#


using HorizonSideRobots

include("Functions.jl")

function Perimetr(r)
    r = Robot("map_1.sit";animate=true)
    start_cord = start!(r, vozvrat=false)

    for s in (Nord, Ost, Sud, West)
        full_move!(r,s,mark=true)
    end

    end!(r,cord=start_cord)
    sleep(300) 
end

r = Robot("map_1.sit";animate=true)
Perimetr(r)