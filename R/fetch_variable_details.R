#' Download and parse the JSON representation of a decennial table's variables
#'
#' If you don't ask for a specific table with the `.group` argument then this
#' function will download information about every variable in the data product.
#'
#' @param .vintage `<int>` which decennial census the table comes from
#' @param .table_or_survey_code `<chr>` the abbreviated name of the data product where the table appears, like "pl" or "dhc
#' @param .group `<chr?>` the specific table to pull information about, like "PCT12" or "PL"
#'
#' @returns `<tbl>` a data frame with a "Variable" column and one or more columns of details.
#' @export
fetch_variable_details <- function(.vintage,
                           .table_or_survey_code,
                           .group = NULL) {
    .final_part <- .group |>
        is.null() |>
        ifelse(
            "/variables",
            paste0("/groups/", .group, "")
        ) |>
        paste0(
            ".json"
        )

    .raw_json <- "https://api.census.gov/data/" |>
        paste0(
            .vintage,
            "/dec/",
            .table_or_survey_code,
            .final_part
        ) |>
        .download_json_metadata() |>
        .wrangle_json_list() |>
        dplyr::select(
            "Variable",
            "Details"
        ) |>
        hoist_group_details(
            .detail_col = "Details"
        )
}

.download_json_metadata <- function(.url) {
    .url |>
        jsonlite::read_json() |>
        purrr::pluck(1)
}

.label_to_details <- function(.labels) {
    .labels |>
        stringr::str_remove_all(":") |>
        stringr::str_remove("Estimate!!") |>
        stringr::str_remove("Total(!!|$)") |>
        stringr::str_split("( ?-+)?!+")
}

.wrangle_json_list <- function(.jsonlist) {
    .jsonlist |>
        purrr::list_transpose() |>
        tibble::as_tibble() |>
        dplyr::mutate(
            Variable = names(.data$concept),
            Details = .label_to_details(.data$label)
        )
}

