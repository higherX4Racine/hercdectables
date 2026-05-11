# Unpack the ragged list of details about a group's variables

The table that this function creates will have one column for each value
in the longest list among `.glossary`'s values of `.detail_col`. They
will be labeled with capital letters. That means that the function will
crash in the unlikely case where the widest element of `.glossary`'s
`.detail_col` has more than 26 values.

## Usage

``` r
hoist_group_details(.glossary, .detail_col = "Details")
```

## Arguments

- .glossary:

  `<tbl>` A data frame (probably
  [`DHC_VARIABLES`](https://higherx4racine.github.io/hercdectables/reference/DHC_VARIABLES.md))

- .detail_col:

  `<chr?>` The name of the column with ragged lists of information.
  Defaults to "Details"

## Value

`<tbl>` a data frame with extra columns hoisted from `.detail_col`
