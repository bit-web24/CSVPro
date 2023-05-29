using Statistics

function calculate_statistics(data)
    stats = Dict{String, Any}()

    for col in names(data)
        col_data = data[!, col]
        if !isempty(col_data)
        	if eltype(col_data) <: Number
            	stats["$col Mean"] = mean(col_data)
            	stats["$col Median"] = median(col_data)
            	stats["$col Standard Deviation"] = std(col_data)
        	end
    	end
    end

    return stats
end