using HorizonSideRobots

HSR = HorizonSideRobots

abstract type AbstractRobot end

HSR.move!(robot::AbstractRobot, side) = move!(get_baserobot(robot), side)
HSR.isborder(robot::AbstractRobot, side) = isborder(get_baserobot(robot), side)
HSR.putmarker!(robot::AbstractRobot) = putmarker!(get_baserobot(robot))
HSR.ismarker(robot::AbstractRobot) = ismarker(get_baserobot(robot))
HSR.temperature(robot::AbstractRobot) = temperature(get_baserobot(robot))

mutable struct Coordinates
    x::Int
    y::Int
end

function HorizonSideRobots.move!(coord::Coordinates, side::HorizonSide)
    if side == Ost
        coord.x +=1
    elseif side == West
        coord.x -=1
    elseif side == Nord
        coord.y +=1
    else
        coord.y -=1
    end
end

get(coord::Coordinates) = (coord.x, coord.y)


mutable struct CordRobot <: AbstractRobot
    robot::Robot
    coordinates::Coordinates
    orientation::Bool
    S::Int
    CordRobot(r) = new(r, Coordinates(0,0), true, 0)
end

get_baserobot(robot::CordRobot) = robot.robot

function HSR.move!(robot::CordRobot, side)
    move!(robot.robot, side)
    move!(robot.coordinates, side)
    x, y = get(robot.coordinates)
    return x, y
end

function orientation(r::CordRobot)
    o = r.orientation

    if isborder(r, Nord) & isborder(r, Sud) && (isborder(r, Ost)||isborder(r, West))
        r.orientation = false
    elseif isborder(r, Nord) && isborder(r, Sud) && !o
        r.orientation = false
    elseif (isborder(r, Nord) || isborder(r, Sud)) && !o
        r.orientation = false
    else
        r.orientation = true
    end

end

