using PrettyTables

function generate_report(filtered_data, stats, output)
    # Display the filtered data in tabular form
    println("Filtered Data:")
    pretty_table(filtered_data)
    
    # Display the calculated statistics
    println("\nStatistics:")
    for (stat_name, stat_value) in stats
        println("$stat_name: $stat_value")
    end
    
    # Save the report to a file if specified
    if output !== nothing
        save_report(filtered_data, stats, output)
    end
end

function save_report(filtered_data, stats, output)
    # Create a file or open an existing file for writing
    file = open(output, "w")
    
    # Write the filtered data to the file
    write(file, "Filtered Data:\n")
    write(file, pretty_table(filtered_data))
    write(file, "\n\n")
    
    # Write the statistics to the file
    write(file, "Statistics:\n")
    for (stat_name, stat_value) in stats
        write(file, "$stat_name: $stat_value\n")
    end
    
    # Close the file
    close(file)
end
