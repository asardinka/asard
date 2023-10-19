using HorizonSideRobots


HSR = HorizonSideRobots
include("librobot.jl")

mutable struct ChessMarkRobot <: AbstractRobot
    robot::Robot
    flag::Bool
    function ChessMarkRobot(robot, flag)
        if flag == true
            putmarker!(robot)
        end
        new(robot,flag)
    end
end

get_baserobot(robot::ChessMarkRobot) = robot.robot

function HSR.move!(robot::ChessMarkRobot, side)
    move!(robot.robot, side)
    robot.flag = !robot.flag
    if robot.flag == true
        putmarker!(robot)
    end
    return Nothing
end