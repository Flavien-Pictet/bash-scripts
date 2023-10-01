## CSV Data Cleaning and Formatting Script

This Bash script is designed to clean and format data in CSV (Comma-Separated Values) files. It performs the following operations:

1. Usage
Before using the script, ensure that you have Bash installed on your system. You can run the script with the following command:

```bash
./clean_csv.sh <input_file> <output_file>
```

<input_file>: The path to the input CSV file that you want to clean.
<output_file>: The path to the output file where the cleaned data will be saved.

2. Data Cleaning Operations

The script performs the following data cleaning operations on the input CSV file:

- Removes leading and trailing whitespaces from each line.
- Replaces all occurrences of "," with a space.
- Removes double quotes (") from each field.
- Restores the original CSV format by replacing spaces with ",".
