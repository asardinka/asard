
using HorizonSideRobots


include("Functions.jl")

function is_border_in_row!(r, side, side_n)
    k, c, shag = 0, 0, 0
    while !isborder(r, side_n)
        flag = c
        if isborder(r, side)
            c+=1
        else
            c = 0
        end
        if c == 0 && flag >0
            k+=1
        end        
        move!(r, side_n)
        shag +=1
    end
    flag = c
    if isborder(r, side)
        c+=1
    else
        c = 0
    end
    if c == 0 && flag >0
        k+=1
    end   
    return shag, k, c
end


function main(r)
    
    start_cord = start!(r, vozvrat=false)
    side = Nord
    side_n = Ost
    k = 0
    sum = 0
    while true
        k = is_border_in_row!(r, side, side_n)
        sum+=k[2]
        if k[1]==k[3]-1
            break
        end
        move!(r, Nord)
        side_n = inverse(side_n)
    end
    end!(r,cord=start_cord)
    return sum
end


r = Robot("peregorodki.sit", animate=false)
println(main(r))

# 41 перегородка