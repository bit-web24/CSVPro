using DataFrames

function get_operator(operator_string)
    operator_dict = Dict(
        "==" => (x, y) -> x == y,
        "<" => (x, y) -> x < y,
        ">" => (x, y) -> x > y,
        "<=" => (x, y) -> x <= y,
        ">=" => (x, y) -> x >= y
    )

    return operator_dict[operator_string]
end


function filter_data(data::DataFrame, column::Any, value::Any, condition::Any)
    filtered_data = nothing

    if column === nothing && value === nothing && condition === nothing
        # No filtering arguments provided
        filtered_data = data
    elseif column !== nothing && value === nothing && condition === nothing
        # Filter by column only
        filtered_data = DataFrame(column=data[!, column])
    elseif column !== nothing && value !== nothing && condition === nothing
        # Filter by column and value
        col_type = eltype(data[!, Symbol(column)])

        if col_type == Int64
            filtered_data = filter(row -> row[Symbol(column)] == eval(Meta.parse(value)), data)
        elseif col_type == Float64
            filtered_data = filter(row -> row[Symbol(column)] == eval(Meta.parse(value)), data)
        elseif col_type == String
            filtered_data = filter(row -> row[Symbol(column)] == value, data)
        else
            @warn "Unsupported column type: $col_type"
            return DataFrame()
        end
    elseif column !== nothing && value !== nothing && condition !== nothing
        # Filter by column, value, and condition
        col_type = eltype(data[!, Symbol(column)])

        if col_type == Int64
            filtered_data = filter(row -> get_operator(condition)(row[Symbol(column)], eval(Meta.parse(value))), data)
        elseif col_type == Float64
        elseif col_type == Float64
            filtered_data = filter(row -> get_operator(condition)(row[Symbol(column)], eval(Meta.parse(value))), data)
        elseif col_type == String
            filtered_data = filter(row -> row[Symbol(column)] == value, data)
        else
            @warn "Unsupported column type: $col_type"
            filter_data = DataFrame()
        end
    else
        # Invalid combination of arguments
        @error "Invalid combination of filtering arguments.="
        filter_data = DataFrame()
    end

    return filtered_data
end