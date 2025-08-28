
#' Variables from Demographic and Housing Characteristics survey.
#'
#' @format a data frame with five columns
#' \describe{
#'   \item{Concept}{&lt;chr&gt; a verbal description of the group's contents}
#'   \item{Group}{&lt;chr&gt; the code that designates the variable's group}
#'   \item{Index}{&lt;int&gt; the row number of the variable}
#'   \item{Variable}{&lt;chr&gt; the complete variable name}
#'   \item{Details}{&lt;list&gt; the details for this variable}
#' }
#'
#' @source <https://api.census.gov/data/2020/dec/dhc/variables.html>
"DHC_VARIABLES"

#' Glossary for table PCT2 in the Demographic and Housing Characteristics survey.
#'
#' @format a data frame with seven columns
#' \describe{
#'   \item{Index}{&lt;int&gt; the row number of the variable}
#'   \item{Level}{&lt;int&gt; the level of aggregation of the variable}
#'   \item{One Person}{&lt;lgl&gt; single-person or multi-person household}
#'   \item{Children}{&lt;lgl&gt; are children present in the household}
#'   \item{Family}{&lt;lgl&gt; are the dwellers a family}
#'   \item{Male Householder}{&lt;lgl&gt; is there a male head of household}
#'   \item{Female Householder}{&lt;lgl&gt; is there a female head of household}
#' }
#'
#' @source <https://api.census.gov/data/2020/dec/dhc/groups/PCT2.html>
"DHC_PCT2"
