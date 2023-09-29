#=
ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется
ровно одна внутренняя перегородка в форме прямоугольника. Робот - в
произвольной клетке поля между внешней и внутренней перегородками.
РЕЗУЛЬТАТ: Робот - в исходном положении и по всему периметру
внутренней, как внутренней, так и внешней, перегородки поставлены маркеры.
=#
using HorizonSideRobots

include("Functions.jl")


function Doubl_Perimetr(r)

    

    start_cord = start!(r, vozvrat=false)

    for s in (Nord, Ost, Sud, West)
        full_move!(r,s,mark=true)
    end

    s = find_border!(r) 
    if s == Ost side = (Nord,West,Sud,Ost) else side = (Nord,Ost,Sud,West) end
    for s in side
        putmarker!(r)
        while isborder(r,s)
            move!(r, inverse90(s))
            putmarker!(r)
        end
        move!(r,s)
    end

    end!(r,cord=start_cord)
    sleep(300)
end

r = Robot("map_2.sit";animate=true)
Doubl_Perimetr(r)