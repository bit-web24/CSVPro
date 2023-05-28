using CSV
using DataFrames

function read_csv(filename)
    # Read CSV file into a DataFrame
    df = CSV.File(filename) |> DataFrame
    
    # Convert columns to appropriate data types if needed
    df.Name = parse.(String, df.Name)
    df.Age = parse.(Int, df.Age)
    df.City = parse.(String, df.City)
    
    return df
end
