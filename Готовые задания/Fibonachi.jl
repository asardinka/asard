function f(x)
    #рекурсия
    if x == 1 || x == 2
        return 1
    else 
        return f(x-2)+f(x-1)
    end
end

function fib(x)
    ss = [1,1]
    for i in 3:x
        push!(ss,(ss[i-1]+ss[i-2]))
    end
    return ss[x]
end
