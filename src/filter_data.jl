using DataFrames

function filter_data(data::DataFrame, column::Any, value::Any, condition::Any)
    filtered_data = ()

    if column == nothing && value == nothing && condition == nothing
        # No filtering arguments provided
        filtered_data = data
    elseif column != nothing && value == nothing && condition == nothing
        # Filter by column only
        filtered_data = DataFrame(column = data[!, column])
    elseif column != nothing && value != nothing && condition == nothing
        # Filter by column and value
        # filtered_data = filter(row -> row[Symbol(column)] == value, data)
        # Filter rows containing a particular value in a column
		filtered_rows = data[column .== value, :]
    elseif column != nothing && value != nothing && condition != nothing
        # Filter by column, value, and condition
        filtered_data = filter(row -> eval(parse(condition)), data) do row
            eval(parse(value)) == row[Symbol(column)]
        end
    else
        # Invalid combination of arguments
        error("Invalid combination of filtering arguments.")
        return DataFrame()
    end
    
    return filtered_data
end