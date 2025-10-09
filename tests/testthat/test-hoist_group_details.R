.rags_fixture <- function() {
    tibble::tibble(
        Group = c("A", "B"),
        Details = list(c("a", "b", "c"), c(1:8))
    )
}

.riches_fixture <- function() {
    tibble::tibble(
        Group = c("A", "B"),
        `A` = list("a", 1),
        `B` = list("b", 2),
        `C` = list("c", 3),
        `D` = c(NA,  4),
        `E` = c(NA,  5),
        `F` = c(NA,  6),
        `G` = c(NA,  7),
        `H` = c(NA,  8)
    )
}

test_that("ragged details are converted to columns", {
    rags <- .rags_fixture()
    riches <- .riches_fixture()
    expect_equal(hoist_group_details(rags),
                 riches)
})

test_that("hoisting doesn't need a column named 'Details'", {
    rags <- dplyr::rename(.rags_fixture(),
                          Ragged = "Details")
    riches <- .riches_fixture()
    expect_equal(hoist_group_details(rags,
                                     "Ragged"),
                 riches)
})
