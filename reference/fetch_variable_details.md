# Download and parse the JSON representation of a decennial table's variables

If you don't ask for a specific table with the `.group` argument then
this function will download information about every variable in the data
product.

## Usage

``` r
fetch_variable_details(.vintage, .table_or_survey_code, .group = NULL)
```

## Arguments

- .vintage:

  `<int>` which decennial census the table comes from

- .table_or_survey_code:

  `<chr>` the abbreviated name of the data product where the table
  appears, like "pl" or "dhc

- .group:

  `<chr?>` the specific table to pull information about, like "PCT12" or
  "PL"

## Value

`<tbl>` a data frame with a "Variable" column and one or more columns of
details.
