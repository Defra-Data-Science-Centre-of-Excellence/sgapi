test_that("A valid table ID
          should return a list
          ", {
            expect_type(get_available_scales("NM_1_1"), "list")
          })

