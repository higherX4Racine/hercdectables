## Copyright (C) 2025 by Higher Expectations for Racine County

DHC_PCT2 <- tibble::tribble(
    ~ Index, ~ Level, ~ `One Person`, ~ Children, ~ Family, ~ `Male Householder`, ~ `Female Householder`,
     1L,          5L, NA,             NA,         NA,       NA,                   NA,
     2L,          1L, TRUE,           FALSE,      FALSE,    NA,                   NA,
     3L,          0L, TRUE,           FALSE,      FALSE,    TRUE,                 FALSE,
     4L,          0L, TRUE,           FALSE,      FALSE,    FALSE,                TRUE,
     5L,          4L, FALSE,          NA,         NA,       NA,                   NA,
     6L,          3L, FALSE,          NA,         TRUE,     NA,                   NA,
     7L,          1L, FALSE,          NA,         TRUE,     TRUE,                 TRUE,
     8L,          0L, FALSE,          TRUE,       TRUE,     TRUE,                 TRUE,
     9L,          0L, FALSE,          FALSE,      TRUE,     TRUE,                 TRUE,
    10L,          2L, FALSE,          NA,         TRUE,     NA,                   NA,
    11L,          1L, FALSE,          NA,         TRUE,     TRUE,                 FALSE,
    12L,          0L, FALSE,          TRUE,       TRUE,     TRUE,                 FALSE,
    13L,          0L, FALSE,          FALSE,      TRUE,     TRUE,                 FALSE,
    14L,          1L, FALSE,          NA,         TRUE,     FALSE,                TRUE,
    15L,          0L, FALSE,          TRUE,       TRUE,     FALSE,                TRUE,
    16L,          0L, FALSE,          FALSE,      TRUE,     FALSE,                TRUE,
    17L,          1L, FALSE,          FALSE,      FALSE,    NA,                   NA,
    18L,          0L, FALSE,          FALSE,      FALSE,    TRUE,                 FALSE,
    19L,          0L, FALSE,          FALSE,      FALSE,    FALSE,                TRUE
)

usethis::use_data(DHC_PCT2, overwrite = TRUE)
