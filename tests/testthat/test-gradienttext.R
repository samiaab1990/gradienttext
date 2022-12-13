test_that("make_gradient() returns error if there are less than two colors", {
  expect_error(make_gradient(label = "this is a test label",colors=c("green")))
})

test_that("make_gradient() returns error if label is null", {
  expect_error(make_gradient(colors=c("green","blue")))
})



