# Combinations of racial and Hispanic or non-Hispanic ethnic identities.

Each vintage provides a slightly different path to its block-level
counts of people by OMB race and ethnicity. All three tables have the
same structure, however. That means there are two parts to this
glossary:

## Usage

``` r
GLOSSARY_OF_ETHNICITY_BY_RACE
```

## Format

An object of class `list` of length 2.

## Source

<https://api.census.gov/data/2000/dec/sf1/groups/P008.html>

<https://api.census.gov/data/2010/dec/sf1/groups/P5.html>

<https://api.census.gov/data/2020/dec/dhc/groups/P5.html>

## Details

### Indices

An object of class `tbl_df`/`tbl`/`data.frame` with 17 rows and 3
columns

- Index:

  `<int>` the row number of the variable

- Ethnicity:

  `<chr>` either "Hispanic" or "Not Hispanic"

- Race:

  `<chr>` One of the seven OMB racial categories

### Vintages

An object of class `tbl_df`/`tbl`/`data.frame` with 3 rows and 5 columns

- Vintage:

  `<int>` a decennial census year

- Product:

  `<chr>` a short code for building the API URL

- Group:

  `<chr>` the code for the table

- Separator:

  `<chr>` used for building variable names, either "" or "\_"

- Suffix:

  `<chr>` Later vintages have multiple pieces of information per index,
  distinguished by suffix
