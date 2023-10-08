#=
6. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля, на котором могут находиться также внутренние прямоугольные
перегородки (все перегородки изолированы друг от друга, прямоугольники
могут вырождаться в отрезки)
РЕЗУЛЬТАТ: Робот - в исходном положении и -
a) по всему периметру внешней рамки стоят маркеры;
201
б) маркеры не во всех клетках пер
=#

using HorizonSideRobots

include("Functions.jl")

function full_start!(r)
    cord = []
    side = West
    while !isborder(r, West) || !isborder(r, Sud)
        push!(cord, full!(r, side))
        
        if side == Sud
            side = West
        else
            side = Sud
        end
        
    end
    if length(cord)%2 !=0
        push!(cord, 0)
    end
    return cord
end

function full_end!(r, cord)
    side = Nord
    for x in reverse(cord)
        move_num!(r, side, x)

        if side == Nord
            side = Ost
        else
            side = Nord
        end

    end
end

function main(r)
    start_cord = full_start!(r)

    for s in (Nord, Ost, Sud, West)
        full_move!(r,s,mark=true)
    end

    full_end!(r, srart_cord)
end

r = Robot("mark_5.sit", animate = true)

main(r)

sleep(30)