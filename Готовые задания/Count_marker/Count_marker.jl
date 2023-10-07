using HorizonSideRobots

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))
function move_count!(r, side)
    c = 0
    m = 0
    c+=ismarker(r)
    while !isborder(r, side)
        move!(r, side)
        if !ismarker(r) 
            m = max(m,c) 
            c = 0 
        end
        c+=ismarker(r)
        
    end
    return m
end

function main(r)
    
    s = Ost
    ans = 0
    k = move_count!(r, s)
    ans = max(ans, k)
    while !isborder(r, Nord)
        move!(r,Nord)
        s = inverse(s)
        k = move_count!(r, s)
        ans = max(ans, k)
    end        
    sleep(30)
    return ans
end

r = Robot("mark.sit", animate=true)
println(main())