include("csv_helpers.jl")
include("filter_data.jl")
include("statistics.jl")
include("report_generator.jl")
include("argument_parser.jl")
include("file_io.jl")

function main()
    args = parse_arguments()

    # Access the parsed arguments
    csvfile = get_arg(args, "csvfile")
    column = get_arg(args, "column")
    value = get_arg(args, "value")
    condition = get_arg(args, "condition")
    output = get_arg(args, "output")

    # Check if the CSV file is provided
    if isempty(csvfile)
        @error "CSV file not provided"
        return
    end

    # Check if the CSV file exists
    if !isfile(csvfile)
        @error "Error: CSV file does not exist"
        return
    end

    # Read CSV file
    data = read_csv(csvfile)

    # Filter data based on specified criteria
    filtered_data = filter_data(data, column, value, condition)

    # Calculate statistics
    stats = calculate_statistics(filtered_data)

    # Generate reports
    generate_report(filtered_data, stats, output)

    println("CSVpro: CSV data processing complete!")
end

# Entry point of the application
main()
