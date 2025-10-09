## Copyright (C) 2025 by Higher Expectations for Racine County

#' Variables from Demographic and Housing Characteristics survey.
#'
#' @format a data frame with five columns
#' \describe{
#'   \item{Concept}{`<chr>` a verbal description of the group's contents}
#'   \item{Group}{`<chr>` the code that designates the variable's group}
#'   \item{Index}{`<int>` the row number of the variable}
#'   \item{Variable}{`<chr>` the complete variable name}
#'   \item{Details}{`<lst>` the details for this variable}
#' }
#'
#' @source <https://api.census.gov/data/2020/dec/dhc/variables.html>
"DHC_VARIABLES"

#' Glossary for table PCT2 in the Demographic and Housing Characteristics survey.
#'
#' @format a data frame with seven columns
#' \describe{
#'   \item{Index}{`<int>` the row number of the variable}
#'   \item{Level}{`<int>` the level of aggregation of the variable}
#'   \item{One Person}{`<lgl>` single-person or multi-person household}
#'   \item{Children}{`<lgl>` are children present in the household}
#'   \item{Family}{`<lgl>` are the dwellers a family}
#'   \item{Male Householder}{`<lgl>` is there a male head of household}
#'   \item{Female Householder}{`<lgl>` is there a female head of household}
#' }
#'
#' @source <https://api.census.gov/data/2020/dec/dhc/groups/PCT2.html>
"DHC_PCT2"

#' A very detailed accounting of people's ages by sex
#'
#' There are fifteen tables that count people by exact age, sex.
#' They all have the same format, with the same rows in each table corresponding
#' to the same ages and sexes.
#' Each different table documents the age-by-sex structure of a different race
#' or ethnic group
#' This particular collection has a detailed partitioning of racial identities
#' into Hispanic and non-Hispanic ethnic identities.
#'
#' @format ## GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX
#' An object of class `tbl_df`/`tbl`/`data.frame`
#' 209 rows and 4 columns
#' \describe{
#'   \item{Sex      }{`<chr>` NA, "Male," or "Female".}
#'   \item{Lower Age}{`<int>` inclusive, because the extreme age groups are ranges.}
#'   \item{Upper Age}{`<int>` exclusive. because the extreme age groups are ranges.}
#'   \item{Index    }{`<int>` the row of the table that corresponds to this sex-age combination.}
#' }
#' @source <https://api.census.gov/data/2000/dec/sf1/groups/PCT012.html>
#' @source <https://api.census.gov/data/2010/dec/sf1/groups/PCT12.html>
#' @source <https://api.census.gov/data/2020/dec/dhc/groups/PCT12.html>
"GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX"

#' Combinations of racial and Hispanic or non-Hispanic ethnic identities.
#'
#' There are fifteen tables that count people by exact age, sex.
#' Each different table documents the age-by-sex structure of a different
#' combination of racial and Hispanic or non-Hispanic ethnic identities.
#'
#' @format ## GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE
#' An object of class `tbl_df`/`tbl`/`data.frame`
#' 16 rows and 4 columns
#' \describe{
#'   \item{Race Code  }{`<chr>` An empty string or a capital lettern from "A" to "O."}
#'   \item{Race       }{`<chr>` Brief labels for the racial identities of each table.}
#'   \item{Hispanic   }{`<lgl>` Whether the table counts people of Hispanic (`TRUE`), non-Hispanic (`FALSE`), or All ethnicities (`NA`).}
#'   \item{Description}{`<chr>` The full description, from the Census, of the race-ethnicity combination described by the table.}
#' }
#' @source <https://api.census.gov/data/2000/dec/sf1/groups/PCT012.html>
#' @source <https://api.census.gov/data/2010/dec/sf1/groups/PCT12.html>
#' @source <https://api.census.gov/data/2020/dec/dhc/groups/PCT12.html>
"GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE"
