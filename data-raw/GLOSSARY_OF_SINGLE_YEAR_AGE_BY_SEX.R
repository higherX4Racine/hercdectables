## Copyright (C) 2025 by Higher Expectations for Racine County

GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX <- tibble::tibble(
    Sex = NA,
    `Lower Age` = 0L,
    `Upper Age` = 999L
) |>
    dplyr::bind_rows(
        tidyr::expand_grid(
            Sex = c("Male", "Female"),
            tibble::tibble(
                `Lower Age` = c(  0L,  0L:99L, 100L, 105L, 110L),
                `Upper Age` = c(999L, 1L:100L, 105L, 110L, 999L)
            )
        )
    ) |>
    dplyr::mutate(
        Index = dplyr::row_number()
    )

usethis::use_data(GLOSSARY_OF_SINGLE_YEAR_AGE_BY_SEX, overwrite = TRUE)
