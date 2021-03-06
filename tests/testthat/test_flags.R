context("Flags")

#flag_dat <- get_eurostat("t2020_rk310", type = "label", keepFlags=T, cache = FALSE)
#flag_dat <- get_eurostat("tsdtr210", type = "label", keepFlags=T, cache = FALSE)
flag_dat <- get_eurostat("road_pa_buscoa", type = "label", keepFlags=T, cache = FALSE)


test_that("get_eurostat includes flags",{
  skip_on_cran()
  expect_true(all(c("flags") %in%
                    names(get_eurostat("road_eqr_trams", keepFlags = TRUE))))
})

test_that("keepFlags + label as in #61",{
  skip_on_cran()
  expect_true(all(c("flags") %in%
                    names(flag_dat)))
})

test_that("flag content",{
  skip_on_cran()
  expect_true(all(c("b", "e") %in%
              unique(flag_dat$flags)))
})

