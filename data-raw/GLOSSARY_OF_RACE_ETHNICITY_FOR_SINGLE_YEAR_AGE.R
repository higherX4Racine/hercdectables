## code to prepare `GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE` dataset goes here

GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE <- tibble::tribble(
    ~ `Race Code`, ~ Race,             ~ Hispanic, ~ Description,
    "",            "All",              NA,         "",
    "A",           "White",            NA,         "WHITE ALONE",
    "B",           "Black",            NA,         "BLACK OR AFRICAN AMERICAN ALONE",
    "C",           "Native American",  NA,         "AMERICAN INDIAN AND ALASKA NATIVE ALONE",
    "D",           "Asian",            NA,         "ASIAN ALONE",
    "E",           "Pacific Islander", NA,         "NATIVE HAWAIIAN AND OTHER PACIFIC ISLANDER ALONE",
    "F",           "Other",            NA,         "SOME OTHER RACE ALONE",
    "G",           "Multiracial",      NA,         "TWO OR MORE RACES",
    "H",           "All",              TRUE,       "HISPANIC OR LATINO",
    "I",           "White",            FALSE,      "WHITE ALONE, NOT HISPANIC OR LATINO",
    "J",           "Black",            FALSE,      "BLACK OR AFRICAN AMERICAN ALONE, NOT HISPANIC OR LATINO",
    "K",           "Native American",  FALSE,      "AMERICAN INDIAN AND ALASKA NATIVE ALONE, NOT HISPANIC OR LATINO",
    "L",           "Asian",            FALSE,      "ASIAN ALONE, NOT HISPANIC OR LATINO",
    "M",           "Pacific Islander", FALSE,      "NATIVE HAWAIIAN AND OTHER PACIFIC ISLANDER ALONE, NOT HISPANIC OR LATINO",
    "N",           "Other",            FALSE,      "SOME OTHER RACE ALONE, NOT HISPANIC OR LATINO",
    "O",           "Multiracial",      FALSE,      "TWO OR MORE RACES, NOT HISPANIC OR LATINO"
)
usethis::use_data(GLOSSARY_OF_RACE_ETHNICITY_FOR_SINGLE_YEAR_AGE, overwrite = TRUE)
