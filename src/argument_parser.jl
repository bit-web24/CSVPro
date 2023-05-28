using ArgParse

function parse_arguments()
    parser = ArgParse.ArgParser("CSVpro", description="CSV data processing tool")

    # Specify the CSV file argument
    ArgParse.add_arg!(parser, "csvfile", help="Path to the CSV file to process")

    # Specify filtering criteria arguments
    ArgParse.add_arg!(parser, "--column", help="Name of the column to filter on")
    ArgParse.add_arg!(parser, "--value", help="Value to filter on")
    ArgParse.add_arg!(parser, "--condition", help="Filtering condition, e.g., '>', '<', '=='")

    # Specify output options
    ArgParse.add_arg!(parser, "--output", help="Path to save the processed data or reports")

    # Parse the command-line arguments
    ArgParse.parse_args!(parser)
end
