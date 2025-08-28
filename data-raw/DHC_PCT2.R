## code to prepare `DHC_PCT2` dataset goes here

DHC_PCT2 <- "extdata" |>
    system.file(
        "DHC_PCT2.csv",
        package = "hercdectables"
    ) |>
    readr::read_csv(
        col_types = list(
            Index = "i",
            Level = "i",
            `One Person` = "l",
            Children = "l",
            Family = "l",
            `Male Householder` = "l",
            `Female Householder` = "l"
        )
    )

usethis::use_data(DHC_PCT2, overwrite = TRUE)
