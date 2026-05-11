## Copyright (C) 2026 by Higher Expectations for Racine County

GLOSSARY_OF_TENURE_BY_ETHNICITY_AND_RACE <- "extdata" |>
    system.file(
        "GLOSSARY_OF_TENURE_BY_ETHNICITY_AND_RACE.csv",
        package = "hercdectables"
    ) |>
    readr::read_csv(
        col_types = list(
            Vintage = "i",
            Group = "c",
            Index = "i",
            Variable = "c",
            Tenure = "c",
            Ethnicity = "c",
            Race = "c"
        )
    )

usethis::use_data(GLOSSARY_OF_TENURE_BY_ETHNICITY_AND_RACE, overwrite = TRUE)
