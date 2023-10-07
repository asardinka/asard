#=
ДАНО: Где-то на неограниченном со всех сторон поле без внутренних
перегородок имеется единственный маркер. Робот - в произвольной клетке этого
поля.
РЕЗУЛЬТАТ: Робот - в клетке с маркером
=#

using HorizonSideRobots

include("Functions.jl")

function move_mark!(r, side)
    move!(r,side)
    return ismarker(r)
end

function go!(r,side, num)
    for i in 1:num
        if move_mark!(r, side)
            return true 
        end
    end
    return false
end

function main(r)
    

    k = 1
    flag = false
    side = Nord
    while !flag
        flag = go!(r, side, Int(ceil(k/2)))
        k+=1
        side = inverse90(side)
    end
    sleep(10)
end

r = Robot("map_3.sit", animate=true)
main(r)
