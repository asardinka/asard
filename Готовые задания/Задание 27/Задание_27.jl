rec_sum(x;part_sum = 0) =
if isempty(x)
    return part_sum
else
    rec_sum(@view(x[begin:end-1]),part_sum=part_sum+x[end])
end