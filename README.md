# CsvParser

Ruby script that parses a CSV

### Required columns
Name, Email, Sign Up Date and Role

### Return
```
{
  success: Boolean
  max_date_record: Hash
  min_date_record: Hash
}
```
max_date_record and max_date_record hashes represent a row from the CSV file, selected based on the `Sign Up date`

## Tests

### Install depedencies
`bundle install`

### Run tests
`rake`
