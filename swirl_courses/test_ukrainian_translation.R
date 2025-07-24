test_that("Ukrainian translations are loaded correctly", {
  translation_data <- load_translation("swirl_courses/R_Programming_Alt/Missing_Values/ukrainian_translation.json")
  expect_true(!is.null(translation_data))
  
  expected_output <- "Очікуване повідомлення"
  actual_output <- translate("Expected message", translation_data)
  expect_equal(actual_output, expected_output)
})