#=
ДАНО: Робот находится в произвольной клетке ограниченного
прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре косого креста из
маркеров, расставленных вплоть до внешней рамки.
=#


using HorizonSideRobots

include("Functions.jl")

function Cross_on_start()
    r = Robot("map_1.sit";animate=true)
    
    for s_1 in (Nord, Sud)
        for s_2 in (West, Ost)
            move_rungs!(r, s_1, s_2; mark_full = false, mark_cross=true, rev = true)
        end
    end

    sleep(300) 
end

Cross_on_start()