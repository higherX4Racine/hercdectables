## Copyright (C) 2025 by Higher Expectations for Racine County

#' Unpack the ragged list of details about a group's variables
#'
#' The table that this function creates will have one column for each value in
#' the longest list among `.glossary`'s values of `.detail_col`.
#' They will be labeled with capital letters.
#' That means that the function will crash in the unlikely case where the
#' widest element of  `.glossary`'s `.detail_col` has more than 26 values.
#'
#' @param .glossary `<tbl>` A data frame (probably [`DHC_VARIABLES`])
#' @param .detail_col `<chr?>` The name of the column with ragged lists of information. Defaults to "Details"
#' @returns `<tbl>` a data frame with extra columns hoisted from `.detail_col`
#' @export
hoist_group_details <- function(.glossary, .detail_col = "Details"){
    .width <- .glossary[[.detail_col]] |>
        purrr::map_int(length) |>
        max()
    .field_list <- rlang::set_names(1:.width,
                                    LETTERS[1:.width])
    tidyr::hoist(.glossary,
                 .col = tidyselect::all_of(.detail_col),
                 !!!.field_list)
}
