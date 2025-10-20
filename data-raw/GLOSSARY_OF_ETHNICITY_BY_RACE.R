## Copyright (C) 2025 by Higher Expectations for Racine County

`GLOSSARY_OF_ETHNICITY_BY_RACE` <- list(
    Indices = tibble::tribble(
        ~ Index, ~ Ethnicity,              ~ Race,
         3L,     "Not Hispanic or Latino", "White alone",
         4L,     "Not Hispanic or Latino", "Black or African American alone",
         5L,     "Not Hispanic or Latino", "American Indian and Alaska Native alone",
         6L,     "Not Hispanic or Latino", "Asian alone",
         7L,     "Not Hispanic or Latino", "Native Hawaiian and Other Pacific Islander alone",
         8L,     "Not Hispanic or Latino", "Some Other Race alone",
         9L,     "Not Hispanic or Latino", "Two or More Races",
        11L,     "Hispanic or Latino",     "White alone",
        12L,     "Hispanic or Latino",     "Black or African American alone",
        13L,     "Hispanic or Latino",     "American Indian and Alaska Native alone",
        14L,     "Hispanic or Latino",     "Asian alone",
        15L,     "Hispanic or Latino",     "Native Hawaiian and Other Pacific Islander alone",
        16L,     "Hispanic or Latino",     "Some Other Race alone",
        17L,     "Hispanic or Latino",     "Two or More Races"
    ),
    Vintages = tibble::tribble(
        ~ Vintage, ~ Product, ~ Group, ~ Separator, ~ Suffix,
            2020L, "dhc",     "P5",    "_",         "N",
            2010L, "sf1",     "P005",  "",          "",
            2000L, "sf1",     "P008",  "",          ""
    )
)

usethis::use_data(GLOSSARY_OF_ETHNICITY_BY_RACE, overwrite = TRUE)
