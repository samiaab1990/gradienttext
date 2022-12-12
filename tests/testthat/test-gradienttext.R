test_that("make_gradient() returns error if there are less than two colors", {
  expect_error(make_gradient(string_lab = "this is a test label",colors=c("green")))
})

test_that("make_gradient() returns error if string_lab is null", {
  expect_error(make_gradient(colors=c("green","blue")))
})



