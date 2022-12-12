test_that("make_gradient() returns string", {
  expect_true(is.character(make_gradient(string_lab = "this is a test label",colors=c("green","blue"))))
})

test_that("make_gradient() returns error if there are less than two colors", {
  expect_error(is.character(make_gradient(string_lab = "this is a test label",colors=c("green"))))
})

test_that("make_gradient() returns error if string_lab is not a string", {
  expect_error(is.character(make_gradient(string_lab = 1234,colors=c("green","blue"))))
})

