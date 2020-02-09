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
`bundle exec rake`

## How to use

```
bundle exec rake process[CSV_PATH_STRING]
```

### Example

#### Valid CSV
```
rake process['test/fixtures/valid.csv']
```
#### Output
```
Max Sign Up Date user
{"Name"=>"Jacob", "Email"=>"jacab@testmail.com", "Sign Up Date"=>"2020-02-08", "Role"=>"admin"}
Min Sign Up Date user
{"Name"=>"Collin", "Email"=>"collin@testmail.com", "Sign Up Date"=>"2018-02-02", "Role"=>"manager"}
```

#### Invalid CSV
```
rake process['test/fixtures/invalid.csv']
```
#### Output
```
Something went wrong, please check the CSV path.
```
