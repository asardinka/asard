using HorizonSideRobots

include("Functions.jl")


inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))
inverse90(s::HorizonSide) = HorizonSide(mod(Int(s)+1, 4))

function along!(stop_condidion::Function, robot, side)
    while !stop_condidion()
        move!(robot, side)
    end
end

function numstesp_along!(stop_condidion::Function, robot, side)
    n = 0
    while !stop_condidion()
        move!(robot, side)
        n+=1
    end
    return n
end

function try_move!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        return true
    else
        return false
    end
end

function snake!(stop_condition::Function, robot, side1, side2)
	s = side1
	along!(()-> stop_condition() || isborder(robot, s) , robot,s)
	while !stop_condition() && try_move!(robot, side2)
		s = inverse(s)
		along!(()->stop_condition() || isborder(robot, s), robot, s)
	end
end

function move_num!(stop_condidion::Function, robot, side, num)
    for x in 1:num
        if !stop_condidion()
            move!(robot, side)
        else
            return false
        end
    end
    return !stop_condidion()
end

function shuttle!(stop_condition::Function, robot, start_side)
    k = 1
    s = start_side
    while !stop_condition()
        shag = ceil(k/2)
        flag = move_num!(()->stop_condition(),r, s, shag)
        if flag
            move_num!(r, inverse(s), shag)
        end
        k+=1
        s = inverse(s)
    end

end

function spiral!(stop_condition::Function, robot)
    k = 1
    
    side = Nord
    while !stop_condition()
        flag = move_num!(()->stop_condition(),robot, side, Int(ceil(k/2)))
        k+=1
        side = inverse90(side)
    end
end