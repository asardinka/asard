#=
Решить задачу 13, но при условии наличия на поле простых
внутренних перегородок.
Под простыми перегородками мы понимаем изолированные
прямолинейные или прямоугольные перегородки.
=#

using HorizonSideRobots


include("Functions.jl")
include("Struct.jl")

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))
#=
function try_move!(robot::ChessMarkRobot, side)
    ortogonal_side = left(side)
    back_side = inverse(ortogonal_side)
    n=0
    while isborder(robot, side)==true && isborder(robot, ortogonal_side) == false
        move!(robot::ChessMarkRobot, ortogonal_side)
        n += 1
    end
    if isborder(robot,side)==true
        move!(robot::ChessMarkRobot, back_side, n)
        return false
    end
    move!(robot, side)
    if n > 0 # продолжается обход
        along!(()->!isborder(robot, back_side), robot, side) 
        move!(robot::ChessMarkRobot, back_side, n)
    end
    return true
end
=#
function move(r, s)
    if !isborder(r,s)
        move!(r,s)
    end
end
function snake(r)
    s = Ost

    while !isborder(r, West)|| !isborder(r, Nord) 
        while try_move!(r,s) end

        move(r, Nord)

        while try_move!(r,inverse(s)) end

        move(r, Nord)
    end
end

function main!(r)
    r = ChessMarkRobot(r, true)
    snake(r)
end

r = Robot("10_10with_p.sit", animate = true)




