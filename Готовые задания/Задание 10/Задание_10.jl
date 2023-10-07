#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля (без внутренних перегородок)
РЕЗУЛЬТАТ: Робот - в исходном положении, и на всем поле расставлены
маркеры в шахматном порядке клетками размера N*N (N-параметр функции),
начиная с юго-западного угла
=#


using HorizonSideRobots

include("Functions.jl")

function Chess(r)
    size = zamer!(r)
    putmarker!(r)
    c = 0
    s = Ost
    for y in 1:size[1]+1
        for x in 1:size[2]
            c+=1
            move!(r, s)
            if c%2==0
                putmarker!(r)
            end
        end
        
        if !isborder(r,Nord)
            move!(r, Nord)
            c+=1
            if c%2==0
                putmarker!(r)
            end
            s = inverse(s)
        else
            break
        end
    end
end


function main(r)
    #Клетки промаркерованы в шахматном порядке
    

    start_cord = start!(r, vozvrat=false)
    
    Chess(r)

    end!(r,cord=start_cord)
    sleep(300) 
end

r = Robot("map_1.sit", animate=true)
main(r)