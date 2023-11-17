#=
39.
Робот находится рядом с границей лабиринта произвольной формы.
Требуется определить где он находится, внутри лабиринта или снаружи.
=#

using HorizonSideRobots

include("struct39.jl")

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

function scanner(r, side) 

    #Проверка на направление движения

    if isborder(r, right(side)) && !isborder(r, side)
        return side
    elseif !isborder(r, right(side)) 
        return right(side,r)
    elseif !isborder(r, left(side))
        return left(side,r)
    end
    return inverse(side,r)
end

function bypass(r, side) 
    side = left(side)
    cord = (Nothing,Nothing)
    while cord!=(0,0) 
        side = scanner(r, side)
        cord = move!(r, side)
    end 
end

function where(r)
    if r.count > 0
        return "Я Снаружи 😉"
    end
    return "Я Внутри 😉"
end

function main(r, side)

    r = CordRobot(r)
    bypass(r,side)
    println(where(r))

end

# r = Robot("40.sit", animate = true)



