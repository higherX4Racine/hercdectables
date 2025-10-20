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

#' Sex by age for selected age categories.
#'
#' There are 10 of these tables, including one for all people and nine for
#' people in different
#' [OMB97](https://www.census.gov/library/visualizations/interactive/decennial-census-measurement-of-race-and-ethnicity-across-the-decades-1790-2020.html)
#' racial/ethnic categories.
#' The categories range from 1 to 5 or more years in width.
#'
#' @format ## GLOSSARY_OF_AGE_BY_SEX
#' An object of class `tbl_df`/`tbl`/`data.frame`
#' with 49 rows and 4 columns
#' \describe{
#'   \item{Index    }{`<int>` the row of the table that corresponds to this sex-age combination.}
#'   \item{Sex      }{`<chr>` "All", "Male," or "Female".}
#'   \item{Lower Age}{`<int>` inclusive}
#'   \item{Upper Age}{`<int>` inclusive, with `999` as the value for "or over."}
#' }
#' @source <https://api.census.gov/data/2000/dec/sf1/groups/P012.html>
#' @source <https://api.census.gov/data/2010/dec/sf1/groups/P12.html>
#' @source <https://api.census.gov/data/2020/dec/dhc/groups/P12.html>
"GLOSSARY_OF_AGE_BY_SEX"

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
#' with 209 rows and 4 columns
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

#' Combinations of racial and Hispanic or non-Hispanic ethnic identities.
#'
#' Each vintage provides a slightly different path to its block-level counts of
#' people by OMB race and ethnicity.
#' All three tables have the same structure, however.
#' That means there are two parts to this glossary:
#'
#' ### Indices
#'
#' An object of class `tbl_df`/`tbl`/`data.frame`
#' with 13 rows and 3 columns
#' \describe{
#'   \item{Index}{`<int>` the row number of the variable}
#'   \item{Ethnicity}{`<chr>` either "Hispanic" or "Not Hispanic"}
#'   \item{Race}{`<chr>` One of the seven OMB racial categories}
#' }
#'
#' ### Vintages
#'
#' An object of class `tbl_df`/`tbl`/`data.frame`
#' with 3 rows and 4 columns
#' \describe{
#'   \item{Vintage}{`<int>` a decennial census year}
#'   \item{Product}{`<chr>` a short code for building the API URL}
#'   \item{Group}{`<chr>` the code for the table}
#'   \item{Separator}{`<chr>` used for building variable names, either "" or "_"}
#'   \item{Suffix}{`<chr>` Later vintages have multiple pieces of information per index, distinguished by suffix}
#' }
#'
#' @format ## GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE
#' A list of two data tables
#' \describe{
#'   \item{Indices}{Correspondences between row number and race/ethnicity}
#'   \item{Vintages}{The specific information needed to pull the data from each decennial census}
#' }
#' @source <https://api.census.gov/data/2000/dec/sf1/groups/P008.html>
#' @source <https://api.census.gov/data/2010/dec/sf1/groups/P5.html>
#' @source <https://api.census.gov/data/2020/dec/dhc/groups/P5.html>
"GLOSSARY_OF_ETHNICITY_BY_RACE"
