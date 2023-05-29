using ArgParse

function parse_arguments()
    settings = ArgParseSettings(description = "CSV Processing Tool",
                            commands_are_required = false,
                            version = "1.0",
                            add_version = true)

    @add_arg_table! settings begin
        # Specify the CSV file argument
        "--file"
            help="Path to the CSV file to process"
            required = true
        # Specify output options
        "--output", "-o"
            help = "Path to save the processed data or reports"
        # Specify filtering criteria arguments
        "--column"
            help = "Name of the column to filter on"
        "--value"
            help="Value to filter on"
        "--condition"
            help="Filtering condition, e.g., '>', '<', '='"
    end

    # Parse the command-line arguments
    return parse_args(settings)
end
