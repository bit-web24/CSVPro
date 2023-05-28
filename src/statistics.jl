using Statistics

function calculate_statistics(data)
    stats = Dict(
        "Column 1 Mean" => mean(data[!, 1]),
        "Column 1 Median" => median(data[!, 1]),
        "Column 1 Standard Deviation" => std(data[!, 1]),
        "Column 2 Mean" => mean(data[!, 2]),
        "Column 2 Median" => median(data[!, 2]),
        "Column 2 Standard Deviation" => std(data[!, 2])
    )
    
    return stats
end