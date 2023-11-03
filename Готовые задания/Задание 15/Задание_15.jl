#=
Решить задачу 4, но при условии наличия на поле простых внутренних
перегородок
4. ДАНО: Робот находится в произвольной клетке ограниченного
прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре косого креста из
маркеров, расставленных вплоть до внешней рамки.
=#

using HorizonSideRobots

include("Func.jl")



function Cross!(r)
    
    putmarker!(r)
    for s in (Nord, Ost, West, Sud)
        k = 0
        while try_move!(r,s)
            k+=1
            putmarker!(r)
        end
        for i in 1:k
            try_move!(r,inverse(s))
        end
    end
end

r = Robot("10_10with_p2.sit", animate = true)