#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля (без внутренних перегородок)
РЕЗУЛЬТАТ: Робот - в исходном положении, на всем поле расставлены
маркеры в шахматном порядке, причем так, чтобы в клетке с роботом находился
маркер

Решить задачу с использованием обобщённой функции
snake!(robot,(move_side, next_row_side)::NTuple{2,HorizonSide} = (Ost,Nord))
=#

using HorizonSideRobots

include("Func.jl")
include("Struct.jl")


function main(r)
    start_cord = full_start!(r)
    cord = length(start_cord)==0 ? 0 : start_cord
    flag = iseven(sum(cord)) ? true : false

    r = ChessMarkRobot(r, flag)
    
    snake!(()->isborder(r,Nord)&& isborder(r, Ost),r,Ost,Nord)

    full_end!(r, start_cord)
    
end


r = Robot(animate = true)
main(r)