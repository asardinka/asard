#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля (без внутренних перегородок)
РЕЗУЛЬТАТ: Робот - в исходном положении, на всем поле расставлены
маркеры в шахматном порядке, причем так, чтобы в клетке с роботом находился
маркер
=#

using HorizonSideRobots


include("Functions.jl")

function main()
    r = Robot("map_1.sit",animate=true)

    W = full!(r, West, rev=true)
    S = full!(r, Sud, rev=true)
    start_cord = start!(r, vozvrat=false)
    if (S+W)%2!=0
        Chess!(r, shift=true)
    else
        Chess!(r)
    end
    end!(r,cord=start_cord)
    sleep(30)
end


main()