# A very detailed accounting of people's ages by sex

There are fifteen tables that count people by exact age, sex. They all
have the same format, with the same rows in each table corresponding to
the same ages and sexes. Each different table documents the age-by-sex
structure of a different race or ethnic group This particular collection
has a detailed partitioning of racial identities into Hispanic and
non-Hispanic ethnic identities.

## Usage

``` r
GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX
```

## Format

### GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX

An object of class `tbl_df`/`tbl`/`data.frame` with 209 rows and 4
columns

- Sex :

  `<chr>` NA, "Male," or "Female".

- Lower Age:

  `<int>` inclusive, because the extreme age groups are ranges.

- Upper Age:

  `<int>` exclusive. because the extreme age groups are ranges.

- Index :

  `<int>` the row of the table that corresponds to this sex-age
  combination.

## Source

<https://api.census.gov/data/2000/dec/sf1/groups/PCT012.html>

<https://api.census.gov/data/2010/dec/sf1/groups/PCT12.html>

<https://api.census.gov/data/2020/dec/dhc/groups/PCT12.html>
