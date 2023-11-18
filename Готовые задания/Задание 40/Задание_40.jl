#=
40. Робот находится снаружи лабиринта произвольной формы, рядом с его
границей. Требуется найти площадь лабиринта (выраженную числом
внутренних клеток)
=#

using HorizonSideRobots

include("struct40.jl")

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

function scanner(r, side) 

    if isborder(r, right(side)) && !isborder(r, side)
        return side
    elseif !isborder(r, right(side)) 
        return right(side)
    elseif !isborder(r, left(side))
        return left(side)
    end
    return inverse(side)
end

function bypass(Func::Function,r::CordRobot, side) 
    side = left(side)
    cord = (Nothing,Nothing)
    while cord!=(0,0) 
        side = scanner(r, side)
        cord = move!(r, side)
        Func()
    end
end

bypass(r, side)=
    bypass(()->Nothing,r,side)

function count(r::CordRobot)
    cord = r.coordinates
    y = cord.y
    o = r.orientation
    if isborder(r, Nord)
        r.S += (-y-1)*o
    end
    if isborder(r, Sud)
        r.S += (y)*o
    end
    
    orientation(r)
end

function main(r, side)
    r = CordRobot(r)
    bypass(()->count(r),r, side)
    println("S = ", r.S )
end

# r = Robot("40.sit", animate = true)
# Ответ 41

# r = Robot("testik1.sit", animate = true)
# Ответ 18

# r = Robot("testik2.sit", animate = true)
# Ответ 35

# r = Robot("testik3.sit", animate = true)
# Ответ 65

function test()
    map = ["40.sit","testik1.sit", "testik2.sit", "testik3.sit"]
    for m in map
        r = Robot(m)
        main(r, Nord)
    end
end