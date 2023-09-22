#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля
промаркированы.
=#


using HorizonSideRobots

include("Functions.jl")

function main()
    r = Robot(animate=true)
    zmeya!(r)
end

main()