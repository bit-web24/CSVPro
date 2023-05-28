using DataFrames

function filter_data(data, column, value, condition)

filtered_data = nothing

    if isempty(column) && isempty(value) && isempty(condition)
    	# No filtering arguments provided
        filtered_data = data
    elseif !isempty(column) && isempty(value) && isempty(condition)
        # Filter by column only
        filtered_data = filter(row -> row[Symbol(column)], data)
    elseif !isempty(column) && !isempty(value) && isempty(condition)
        # Filter by column and value
        filtered_data = filter(row -> row[Symbol(column)] == value, data)
    elseif !isempty(column) && !isempty(value) && !isempty(condition)
        # Filter by column, value, and condition
        filtered_data = filter(row -> eval(parse(condition)), data) do row
            eval(parse(value)) == row[Symbol(column)]
        end
    else
        # Invalid combination of arguments
        @error "Invalid combination of filtering arguments."
        return DataFrame()
    end
    
    return filtered_data
end