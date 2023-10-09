#=
17. Решить задачу 8 с использованием обобщённой функции
spiral!(stop_condition::Function, robot)
=#
using HorizonSideRobots

include("Func.jl")

function main(r)
    spiral!(()->ismarker(r),r)
end

r = Robot("map_3.sit", animate = true)

main(r)
sleep(20)