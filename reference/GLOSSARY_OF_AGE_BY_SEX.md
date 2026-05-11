# Sex by age for selected age categories.

There are 10 of these tables, including one for all people and nine for
people in different
[OMB97](https://www.census.gov/library/visualizations/interactive/decennial-census-measurement-of-race-and-ethnicity-across-the-decades-1790-2020.html)
racial/ethnic categories. The categories range from 1 to 5 or more years
in width.

## Usage

``` r
GLOSSARY_OF_AGE_BY_SEX
```

## Format

### GLOSSARY_OF_AGE_BY_SEX

An object of class `tbl_df`/`tbl`/`data.frame` with 49 rows and 4
columns

- Index :

  `<int>` the row of the table that corresponds to this sex-age
  combination.

- Sex :

  `<chr>` "All", "Male," or "Female".

- Lower Age:

  `<int>` inclusive

- Upper Age:

  `<int>` inclusive, with `999` as the value for "or over."

## Source

<https://api.census.gov/data/2000/dec/sf1/groups/P012.html>

<https://api.census.gov/data/2010/dec/sf1/groups/P12.html>

<https://api.census.gov/data/2020/dec/dhc/groups/P12.html>
