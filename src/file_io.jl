using CSV
using DataFrames

function read_csv(filename)
    # Read CSV file into a DataFrame
    df = CSV.File(filename) |> DataFrame
    
    # Convert columns to appropriate data types if needed
    df.Name = String.(df.Name)
    df.Age = Int.(df.Age)
    df.City = String.(df.City)
    
    return df
end
