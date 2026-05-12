# Demographic and housing characteristics

## Why the DHC?

The 2020 Demographic and Housing Characteristics file
[(DHC)](http://api.census.gov/data/2020/dec/dhc.md) is a table with
detailed, block-level information about socioeconomic conditions.

The Census API has [other
tables](https://api.census.gov/data/2020/dec.html) from the Decennial
Census, but they lack the level of detail in the DHC. Some tables lack
spatial resolution. For example, tables like the [Demographic Profile
(DP)](http://api.census.gov/data/2020/dec/dp.md) or the [Congressional
District (cd11X)](http://api.census.gov/data/2020/dec/cd119.md) do not
provide data at the block level. Other tables lack demographic
resolution. For example the table of [Redistricting Data
(PL)](http://api.census.gov/data/2020/dec/pl.md) contains many fewer
cross-tabulations between race and housing situation. The DHC provides
fine-grained detail, as can be seen in its definition from the link
above:

> This product will include topics such as age, sex, race, Hispanic or
> Latino origin, household type, family type, relationship to
> householder, group quarters population, housing occupancy and housing
> tenure. Some tables will be iterated by race and ethnicity.

That ambitious portfolio means that the DHC is huge and complex, with
249 [groups](http://api.census.gov/data/2020/dec/dhc/groups.md), or
sub-tables, that hold a total of 9067 separate
[variables](http://api.census.gov/data/2020/dec/dhc/variables.md). I
used the Census API to create a data table in R that captures the
information from the link just above. These variables provide a compact
way for the API to present information, but they need some assistance to
be meaningful to actual humans. That is where glossary tables come in.

## Glossary tables for DHC groups

A glossary table explicitly lays out the connection between the row
number of a Census API variable and the demographic meaning that it
represents. For example, the single variable “H12B_010N” reports the
number of households that are headed by a Black, non-Hispanic person who
is renting, not an owner. Those nine characters therefore encode
information about race, ethnicity, and home ownership. The value of the
variable is another piece of information, the number of households. A
glossary that explains group H12B would therefore need at least 4
columns.

This report documents the process that I will follow to create a
glossary table for each group in the DHC.

## Characteristics of each group

Each glossary will need enough columns to represent all of the details
that are captured by its rows. The first step for glossing a group is to
count how many columns appear in its variables’ lists of details.

``` r

DHC_VARIABLES |>
    dplyr::summarize(
        `Columns Present` = .data$Details |>
            purrr::map(stringr::str_squish) |>
            purrr::map(\(.) .[nchar(.) > 1])  |>
            purrr::map_int(length) |>
            max(),
        .by = "Group"
    ) |>
    dplyr::count(
        .data$`Columns Present`,
        name = "Frequency"
    ) |>
    knitr::kable(
        caption = "How many detail columns are needed by DHC groups."
    )
```

| Columns Present | Frequency |
|----------------:|----------:|
|               0 |         3 |
|               1 |        43 |
|               2 |       112 |
|               3 |        45 |
|               4 |        43 |
|               5 |         3 |

How many detail columns are needed by DHC groups. {.table}

Most of the groups will need two or fewer columns to capture their
details, but many will need more. Three different tables will need five
columns! We’ll use those as examples as we proceed.

``` r

GROUP_DETAILS <- DHC_VARIABLES |>
    dplyr::summarize(
        Concept = dplyr::first(.data$Concept),
        Variables = dplyr::pick("Index", "Variable", "Details") |>
            dplyr::mutate(
                Details = .data$Details |>
                    purrr::map(stringr::str_squish) |>
                    purrr::map(\(.) .[nchar(.) > 1]) |>
                    purrr::map(\(.) tibble::as_tibble_row(., .name_repair = \(.) LETTERS[seq_along(.)]))
                ) |>
            tidyr::unnest("Details") |>
            list(),
        .by = "Group"
    ) |>
    dplyr::mutate(
        Length = purrr::map_int(.data$Variables, nrow),
        Width = purrr::map_int(.data$Variables, ncol) - 2L
    )
```

``` r

EXAMPLE_GROUPS <- GROUP_DETAILS |>
    dplyr::filter(
        .data$Width == 5
    ) |>
    dplyr::select(
        !tidyselect::any_of(c("Variables"))
    )

knitr::kable(
    EXAMPLE_GROUPS,
    caption = "DHC groups that need five columns to capture their details"
)
```

| Group | Concept | Length | Width |
|:---|:---|---:|---:|
| H14 | TENURE BY HOUSEHOLD TYPE BY AGE OF HOUSEHOLDER | 69 | 5 |
| PCT19 | GROUP QUARTERS POPULATION BY SEX BY AGE BY GROUP QUARTERS TYPE | 195 | 5 |
| PCT2 | HOUSEHOLD SIZE BY HOUSEHOLD TYPE BY PRESENCE OF OWN CHILDREN | 19 | 5 |

DHC groups that need five columns to capture their details {.table
style="width:100%;"}

``` r


GROUP_DETAILS |>
    dplyr::filter(
        .data$Width == 0L
    ) |>
    dplyr::select(
        !tidyselect::any_of(c("Variables"))
    ) |>
    knitr::kable(
        caption = "DHC groups that need ZERO columns to capture their details"
    )
```

| Group | Concept                                    | Length | Width |
|:------|:-------------------------------------------|-------:|------:|
| H1    | HOUSING UNITS                              |      1 |     0 |
| H8    | TOTAL POPULATION IN OCCUPIED HOUSING UNITS |      1 |     0 |
| P1    | TOTAL POPULATION                           |      1 |     0 |

DHC groups that need ZERO columns to capture their details {.table}

## An example glossary: PCT2

This is what the details of table PCT2 look like after hoisting.

``` r

PCT2 <- GROUP_DETAILS |>
    dplyr::filter(
        .data$Group == "PCT2"
    ) |>
    dplyr::pull(
        "Variables"
    ) |>
    purrr::pluck(1)

knitr::kable(
    PCT2,
    caption = "The details of group PCT2"
)
```

| Index | Variable | A | B | C | D | E |
|---:|:---|:---|:---|:---|:---|:---|
| 1 | PCT2_001N | NA | NA | NA | NA | NA |
| 2 | PCT2_002N | 1-person household | NA | NA | NA | NA |
| 3 | PCT2_003N | 1-person household | Male householder | NA | NA | NA |
| 4 | PCT2_004N | 1-person household | Female householder | NA | NA | NA |
| 5 | PCT2_005N | 2-or-more-person household | NA | NA | NA | NA |
| 6 | PCT2_006N | 2-or-more-person household | Family households | NA | NA | NA |
| 7 | PCT2_007N | 2-or-more-person household | Family households | Married couple family | NA | NA |
| 8 | PCT2_008N | 2-or-more-person household | Family households | Married couple family | With own children under 18 years | NA |
| 9 | PCT2_009N | 2-or-more-person household | Family households | Married couple family | No own children under 18 years | NA |
| 10 | PCT2_010N | 2-or-more-person household | Family households | Other family | NA | NA |
| 11 | PCT2_011N | 2-or-more-person household | Family households | Other family | Male householder, no spouse present | NA |
| 12 | PCT2_012N | 2-or-more-person household | Family households | Other family | Male householder, no spouse present | With own children under 18 years |
| 13 | PCT2_013N | 2-or-more-person household | Family households | Other family | Male householder, no spouse present | No own children under 18 years |
| 14 | PCT2_014N | 2-or-more-person household | Family households | Other family | Female householder, no spouse present | NA |
| 15 | PCT2_015N | 2-or-more-person household | Family households | Other family | Female householder, no spouse present | With own children under 18 years |
| 16 | PCT2_016N | 2-or-more-person household | Family households | Other family | Female householder, no spouse present | No own children under 18 years |
| 17 | PCT2_017N | 2-or-more-person household | Nonfamily households | NA | NA | NA |
| 18 | PCT2_018N | 2-or-more-person household | Nonfamily households | Male householder | NA | NA |
| 19 | PCT2_019N | 2-or-more-person household | Nonfamily households | Female householder | NA | NA |

The details of group PCT2 {.table}

One of the devilish things about Census data is that the meaning of the
value in a particular row and column depends upon the structure of a
table. Consequently, we cannot look at each value by itself. We have to
try to make meaning of the entire table at once.

| Index | Level of Aggregation | One Person | Children | Family | Male Householder | Female Householder |
|---:|---:|:---|:---|:---|:---|:---|
| 1 | 5 | NA | NA | NA | NA | NA |
| 2 | 1 | TRUE | FALSE | FALSE | NA | NA |
| 3 | 0 | TRUE | FALSE | FALSE | TRUE | FALSE |
| 4 | 0 | TRUE | FALSE | FALSE | FALSE | TRUE |
| 5 | 4 | FALSE | NA | NA | NA | NA |
| 6 | 3 | FALSE | NA | TRUE | NA | NA |
| 7 | 1 | FALSE | NA | TRUE | TRUE | TRUE |
| 8 | 0 | FALSE | TRUE | TRUE | TRUE | TRUE |
| 9 | 0 | FALSE | FALSE | TRUE | TRUE | TRUE |
| 10 | 2 | FALSE | NA | TRUE | NA | NA |
| 11 | 1 | FALSE | NA | TRUE | TRUE | FALSE |
| 12 | 0 | FALSE | TRUE | TRUE | TRUE | FALSE |
| 13 | 0 | FALSE | FALSE | TRUE | TRUE | FALSE |
| 14 | 1 | FALSE | NA | TRUE | FALSE | TRUE |
| 15 | 0 | FALSE | TRUE | TRUE | FALSE | TRUE |
| 16 | 0 | FALSE | FALSE | TRUE | FALSE | TRUE |
| 17 | 1 | FALSE | FALSE | FALSE | NA | NA |
| 18 | 0 | FALSE | FALSE | FALSE | TRUE | FALSE |
| 19 | 0 | FALSE | FALSE | FALSE | FALSE | TRUE |

Glossed details from group PCT2 {.table}

Note that I use `NA` to represent the “any possible value” state for a
factor. I’m not sure that this is a good choice. It might be better to
use an explicit value like ““,”All”, or “\*“. It does make things
consistent across factors and Boolean fields, though.

### Levels of aggregation

The worst thing about Census data files is that they include both
stand-alone observations and subtotals. That is what the
`Level of Aggregation` field is intended to capture. I am very open to
suggestions for better terminology.

Using the `Level of Aggregation` field, we can pull stand-alone rows.
Notice that none of these variables have `NA` in any of their values.
That was originally my way of detecting stand-alone rows, but I can
imagine a situation where some factor is simply irrelevant, rather than
aggregated, so I think it is better to explicitly note each row’s level
of aggregation.

| Variable | Index | Level of Aggregation | One Person | Children | Family | Male Householder | Female Householder |
|:---|---:|---:|:---|:---|:---|:---|:---|
| PCT2_003N | 3 | 0 | TRUE | FALSE | FALSE | TRUE | FALSE |
| PCT2_004N | 4 | 0 | TRUE | FALSE | FALSE | FALSE | TRUE |
| PCT2_008N | 8 | 0 | FALSE | TRUE | TRUE | TRUE | TRUE |
| PCT2_009N | 9 | 0 | FALSE | FALSE | TRUE | TRUE | TRUE |
| PCT2_012N | 12 | 0 | FALSE | TRUE | TRUE | TRUE | FALSE |
| PCT2_013N | 13 | 0 | FALSE | FALSE | TRUE | TRUE | FALSE |
| PCT2_015N | 15 | 0 | FALSE | TRUE | TRUE | FALSE | TRUE |
| PCT2_016N | 16 | 0 | FALSE | FALSE | TRUE | FALSE | TRUE |
| PCT2_018N | 18 | 0 | FALSE | FALSE | FALSE | TRUE | FALSE |
| PCT2_019N | 19 | 0 | FALSE | FALSE | FALSE | FALSE | TRUE |

Variables of PCT2 that are not subtotals or totals. {.table}

We can also pull rows that are aggregations of other rows’ values. Note
that each of these rows will definitely have some `NA` values. The
number of `NA`s in a row is proportional, but not exactly equal, to its
level of aggregation.

| Index | Variable | Level of Aggregation | One Person | Children | Family | Male Householder | Female Householder |
|---:|:---|---:|:---|:---|:---|:---|:---|
| 1 | PCT2_001N | 5 | NA | NA | NA | NA | NA |
| 2 | PCT2_002N | 1 | TRUE | FALSE | FALSE | NA | NA |
| 5 | PCT2_005N | 4 | FALSE | NA | NA | NA | NA |
| 6 | PCT2_006N | 3 | FALSE | NA | TRUE | NA | NA |
| 7 | PCT2_007N | 1 | FALSE | NA | TRUE | TRUE | TRUE |
| 10 | PCT2_010N | 2 | FALSE | NA | TRUE | NA | NA |
| 11 | PCT2_011N | 1 | FALSE | NA | TRUE | TRUE | FALSE |
| 14 | PCT2_014N | 1 | FALSE | NA | TRUE | FALSE | TRUE |
| 17 | PCT2_017N | 1 | FALSE | FALSE | FALSE | NA | NA |

Variables of PCT2 that are subtotals or totals. {.table}
