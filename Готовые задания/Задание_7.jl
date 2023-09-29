using HorizonSideRobots

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))
inverse90(s::HorizonSide) = HorizonSide(mod(Int(s)+1, 4))

include("Functions.jl")

function side_border(r, side, side_n, num)
    move_num!(r, side_n, num)
    p = isborder(r, side)
    if p == false
        move!(r,side)
        move_num!(r, inverse(side_n), num)
        return false
    else
        move_num!(r, inverse(side_n), num)
    end
    return true

end



function main(r)
    
    k = 1
    run = true
    while run 
        run = side_border(r, Nord, Ost, k)
        if !run 
            break 
        end
        k+=1
        run = side_border(r,Nord, West, k)
    end

    sleep(20)
end

r = Robot("Peregorodka.sit", animate = true)
main(r)