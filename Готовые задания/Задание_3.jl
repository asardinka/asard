#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля
промаркированы.
=#


using HorizonSideRobots

include("Functions.jl")

function main(r)
    zmeya!(r)
end

r = Robot(animate=true)
main(r)