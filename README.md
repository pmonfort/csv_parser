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
bundle exec rake process['test/fixtures/valid.csv']
```
#### File example
```
Name,Email,Sign Up Date,Role
Eric,eric@testmail.com,2020-02-07,manager
Carol,carol@testmail.com,2019-02-07,admin
Jim,jim@testmail.com,2019-10-07,admin
Jacob,jacab@testmail.com,2020-02-08,admin
Megan,megan@testmail.com,2019-02-07,manager
Peter,peter@testmail.com,2020-02-07,sales
Collin,collin@testmail.com,2018-02-02,manager
Sofia,sofia@testmail.com,2019-02-07,manager
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
bundle exec rake process['test/fixtures/invalid.csv']
```
#### Output
```
Something went wrong, please check the CSV path.
```
