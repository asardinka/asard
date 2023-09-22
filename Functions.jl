using HorizonSideRobots

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))
inverse90(s::HorizonSide) = HorizonSide(mod(Int(s)+1, 4))
function full!(r, Side; rev = false)
    # Двигает робота до конца определённой стороны, возвращает число шагов
    k=0
    while !isborder(r, Side)
        move!(r, Side)
        k+=1
    end
    if rev
        for x in 1:k
            move!(r, inverse(Side))
        end
    end
    return k
end

function zamer!(r)
    #Замеряет поле, Возвращает кортеж (количество строк, количество столбцов)
    N = full!(r, Nord)
    O = full!(r, Ost)
    size = (N, O)
    start!(r)
    return size
end

function start!(r; vozvrat=false)
    # Двигает робота в левый нижний угол, возвращает изначальные координаты робота
    west = full!(r, West)
    sud = full!(r, Sud)
    f = full!(r, West)
    if vozvrat
        move_num!(r,Ost,f)
        move_num!(r,Nord,sud)
        move_num!(r,Ost,west)
    end
    return (west,sud, f)
end

function full_move!(r,Side; mark = false, v=false, rev = false)
    #Двигает робота до конца направления, mark - закрашивает пройденые точки, v = смещает в конце себя на 1 вверх
    putmarker!(r)
    k = 0
    while !isborder(r, Side)
        move!(r, Side)
        k+=1
        if mark
            putmarker!(r)
        end
    end
    if v && !isborder(r, Nord) 
        move!(r, Nord) 
    end

    if rev
        for α in 1:k
            move!(r,inverse(Side))
        end
    end
end

function zmeya!(r)
    #Закрашивает поле змейкой
    full_move!(r, Ost;mark=true)
    while !isborder(r, Nord)
        move!(r,Nord)
        full_move!(r, West;mark=true)
        if !isborder(r, Nord)
            move!(r,Nord)
            full_move!(r, Ost;mark=true)
        end
    end 
end

function end!(r;cord=(0,0,0))
    #Возвращает робота в изначальное положение
    start!(r)
    move_num!(r,Ost,cord[3])
    move_num!(r,Nord,cord[2])
    move_num!(r,Ost,cord[1])
end

function move_num!(robot,side,num_steps; mark = false, rev = false)
    # Двигает робота в заданном направлении на заданное количество клеток
    if mark
        putmarker!(robot)
    end
    c = 0
    for k in 1:num_steps 
        move!(robot, side)
        c+=1
        if mark
            putmarker!(robot)
        end
    end
    if rev
        for α in 1:c
            move!(robot,inverse(side))
        end
    end
end

function move_rungs!(r, side_first, side_second; mark_full = false, mark_cross=false, rev = false)
    # Двигает робота на одну клетку в две заданные стороны до упора 
    if mark_full putmarker!(r) end
    if mark_cross putmarker!(r) end
    k = 0
    c = 0
    while !isborder(r,side_first)
        move!(r, side_first)
        k +=1
        if mark_full putmarker!(r) end

        if !isborder(r,side_second)
            move!(r, side_second)
            c +=1
            if mark_full putmarker!(r) end
            if mark_cross putmarker!(r) end
        else break
        end
    end

    if rev && k==c
        for x in 1:c
            move!(r, inverse(side_second))
            move!(r, inverse(side_first))
        end
    elseif rev
        move!(r, inverse(side_first))
        for x in 1:c
            move!(r, inverse(side_second))
            move!(r, inverse(side_first))
        end
    end
end

function  find_border!(r)

    side = Ost    
    while find_in_row!(r, side)==false
        move!(r, Nord)
        side = inverse(side)
    end
    return side
end 


function find_in_row!(r, side)
    while !isborder(r, Nord)&&!isborder(r, side)
        move!(r, side)
    end
    return isborder(r, Nord)
end


