## code to prepare `DHC_VARIABLES` dataset goes here

DHC_VARIABLES <-
    "https://api.census.gov/data/2020/dec/dhc/variables.json" |>
    jsonlite::read_json() |>
    purrr::pluck(1) |>
    purrr::map(
        hercacstables:::.glossary_row_to_tibble
    ) |>
    hercacstables:::.wrangle_variables()

usethis::use_data(DHC_VARIABLES, overwrite = TRUE)
