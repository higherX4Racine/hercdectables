# Combinations of racial and Hispanic or non-Hispanic ethnic identities.

There are fifteen tables that count people by exact age, sex. Each
different table documents the age-by-sex structure of a different
combination of racial and Hispanic or non-Hispanic ethnic identities.

## Usage

``` r
GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE
```

## Format

### GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE

An object of class `tbl_df`/`tbl`/`data.frame` 16 rows and 4 columns

- Race Code :

  `<chr>` An empty string or a capital lettern from "A" to "O."

- Race :

  `<chr>` Brief labels for the racial identities of each table.

- Hispanic :

  `<lgl>` Whether the table counts people of Hispanic (`TRUE`),
  non-Hispanic (`FALSE`), or All ethnicities (`NA`).

- Description:

  `<chr>` The full description, from the Census, of the race-ethnicity
  combination described by the table.

## Source

<https://api.census.gov/data/2000/dec/sf1/groups/PCT012.html>

<https://api.census.gov/data/2010/dec/sf1/groups/PCT12.html>

<https://api.census.gov/data/2020/dec/dhc/groups/PCT12.html>
