# Fetch population data broken down by single-year age, sex, and race/ethnicity

Fetch population data broken down by single-year age, sex, and
race/ethnicity

## Usage

``` r
syabsbre(...)
```

## Arguments

- ...:

  Arguments passed on to
  [`hercacstables::fetch_data`](https://higherx4racine.github.io/hercacstables/reference/fetch_data.html)

  `for_geo`

  :   \<chr\> the geographical level the data will describe, e.g.
      `"tract"`

  `for_items`

  :   \<chr\[\]\> one or more instances of `for_geo` desired, e.g. `"*"`
      or `"000200"`, passed on to
      [`build_for_geographies()`](https://higherx4racine.github.io/hercacstables/reference/build_for_geographies.html)

  `use_key`

  :   \<lgl?\> optional, should the query include a Census API key from
      the system environment. Defaults to `TRUE`

## Value

a table with 8 columns

- Vintage:

  `<int>` the decennial census that is the source of this row

- Race:

  `<chr>` a short description of the race of people counted by this row

- Hispanic:

  `<lgl>` whether or not this row's people are Hispanic (`NA` means
  "both.")

- Sex:

  `<chr>` female or male

- Lower Age:

  `<int>` the lowest age among people counted by this row

- Upper Age:

  `<int>` the greatest age among people counted by this row

- GEO_ID:

  `<chr>` the alphanumeric designation of the loction described by this
  row

- Population:

  `<chr>` the count of people with all of the characteristics in the
  other columns.
