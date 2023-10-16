#=
ДАНО: Робот - рядом с горизонтальной бесконечно продолжающейся в
обе стороны перегородкой (под ней), в которой имеется проход шириной в одну
клетку.
РЕЗУЛЬТАТ: Робот - в клетке под проходом
Решить задачу с использованием обобщённой функции shuttle!(stop_condition::Function, robot, side)
=#

using HorizonSideRobots

include("Func.jl")

function main(r)
    shuttle!(()->!isborder(r, Nord),r, Ost)
end

r = Robot("Peregorodka.sit", animate = true)

main(r)
sleep(20)