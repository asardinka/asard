#=

ДАНО: Робот - в произвольной клетке ограниченного прямоугольного
поля, на поле расставлены горизонтальные перегородки различной длины
(перегородки длиной в несколько клеток, считаются одной перегородкой), не
касающиеся внешней рамки. Если в перегородке имеются
разрывы не более одной клетки каждый, то такая перегородка считается одной
перегородкой.

РЕЗУЛЬТАТ: Робот — в исходном положении, подсчитано и возвращено
число всех перегородок на поле.

=#
using HorizonSideRobots


include("Functions.jl")

function is_border_in_row_2!(r, side, side_n)
    k, c, shag, p = 0, 0, 0, 0
    while !isborder(r, side_n)
        flag = c
        if isborder(r, side)
            c+=1
        else
            c = 0
        end
        if p == 1 && !isborder(r, side) && flag == 0
            k+=1
        end  
        if (c == 0 && flag >0)
            p+=1
        else
            p = 0
        end   
        
        move!(r, side_n)
        shag +=1
        println(k)
        sleep(0.7)
    end
    flag = c
    if isborder(r, side)
        c+=1
    else
        c = 0
    end
    if p == 1 && !isborder(r, side) && flag == 0
        k+=1
    end   
    if (c == 0 && flag >0)
        p+=1
        k+=1
    else
        p = 0
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
        k = is_border_in_row_2!(r, side, side_n)
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

r = Robot("peregorodki.sit", animate=true)
println(main(r))

# 22 перегородки