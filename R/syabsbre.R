## Copyright (C) 2025 by Higher Expectations for Racine County

#' Fetch population data broken down by single-year age, sex, and race/ethnicity
#'
#' @inheritDotParams hercacstables::fetch_data -variables -year -survey_type -table_or_survey_code
#'
#' @returns a table with 8 columns
#' \describe{
#'   \item{Vintage}{`<int>` the decennial census that is the source of this row}
#'   \item{Race}{`<chr>` a short description of the race of people counted by this row}
#'   \item{Hispanic}{`<lgl>` whether or not this row's people are Hispanic (`NA` means "both.")}
#'   \item{Sex}{`<chr>` female or male}
#'   \item{Lower Age}{`<int>` the lowest age among people counted by this row}
#'   \item{Upper Age}{`<int>` the greatest age among people counted by this row}
#'   \item{GEO_ID}{`<chr>` the alphanumeric designation of the loction described by this row}
#'   \item{Population}{`<chr>` the count of people with all of the characteristics in the other columns.}
#' }
#' @export
syabsbre <- function(...) {
    tibble::tribble(
        ~ Vintage, ~ Product, ~ Stem,
        2000L,     "sf1",     "PCT012",
        2010L,     "sf1",     "PCT12",
        2020L,     "dhc",     "PCT12"
    ) |>
        tidyr::expand_grid(
            hercdectables::GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE
        ) |>
        dplyr::mutate(
            Group = paste0(.data$Stem, .data$`Race Code`)
        ) |>
        dplyr::mutate(
            Data = purrr::pmap(
                list(.data$Vintage, .data$Product, .data$Group),
                \(Vintage, Product, Group) hercacstables::fetch_data(
                    variables = paste0("group(", Group, ")"),
                    year = Vintage,
                    survey_type = "dec",
                    table_or_survey_code = Product,
                    ...
                ) |>
                    dplyr::filter(
                        !is.na(.data$Value)
                    ) |>
                    dplyr::select(
                        "GEO_ID",
                        "Index",
                        "Value"
                    ) |>
                    dplyr::left_join(
                        hercdectables::GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX,
                        by = "Index"
                    )
            )
        ) |>
        tidyr::unnest(
            cols = "Data"
        ) |>
        dplyr::select(
            "Vintage",
            "Race",
            "Hispanic",
            "Sex",
            "Lower Age",
            "Upper Age",
            "GEO_ID",
            Population = "Value"
        )
}
