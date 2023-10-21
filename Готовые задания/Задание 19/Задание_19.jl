using HorizonSideRobots

function move_recursion(r, side)
    if !isborder(r,side)
        move!(r, side)
        move_recursion(r,side)
    else 
        return Nothing
    end
end
