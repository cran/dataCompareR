# SPDX-Copyright: Copyright (c) Capital One Services, LLC 
# SPDX-License-Identifier: Apache-2.0 
# Copyright 2017 Capital One Services, LLC 
#
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
#
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
#
# Unless required by applicable law or agreed to in writing, software distributed 
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
# OF ANY KIND, either express or implied.

#
# SYSTEM TEST: dataCompareR : Dates
#
# End-to-end system tests of the dataCompareR function that look at 
# different scenarios involving data frames with dates in different
# formats
#

library(testthat)

source('createTwoKeyData.R')

context("DateComparisons")

test_that("ComparisonOfEqualDates", {
  
  dts <- createDateDataset()
  
  dfTableA <- dts[[1]]
  dfTableB <- dts[[2]]
  
  ABcomparison <- rCompare(dfTableA, dfTableB, keys = c("color"))
  
  expect_true(ABcomparison$matches[1] == "DATEA")
  
  expect_true(names(ABcomparison$mismatches)[1] == "DATEB")
  expect_true(nrow(ABcomparison$mismatches[[1]]) == 5)
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB < 0))
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB > -21))

})

test_that("ComparisonOfPOSIXDates", {
  
  dts <- createDateDataset()
  
  dfTableA <- dts[[1]]
  dfTableB <- dts[[2]]

  dfTableA$dateA <- as.POSIXct.Date(dfTableA$dateA)
  dfTableA$dateB <- as.POSIXct.Date(dfTableA$dateB)
  dfTableB$dateA <- as.POSIXct.Date(dfTableB$dateA)
  dfTableB$dateB <- as.POSIXct.Date(dfTableB$dateB)
  
  ABcomparison <- rCompare(dfTableA, dfTableB, keys = c("color"))
  
  expect_true(ABcomparison$matches[1] == "DATEA")
  
  expect_true(names(ABcomparison$mismatches)[1] == "DATEB")
  expect_true(nrow(ABcomparison$mismatches[[1]]) == 5)
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB < 0))
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB > -21))
  
})

test_that("ComparisonOfMixedDates", {
  
  dts <- createDateDataset()
  
  dfTableA <- dts[[1]]
  dfTableB <- dts[[2]]
  
  # Set both dates in A to posix - all should mismatch
  dfTableA$dateA <- as.POSIXct.Date(dfTableA$dateA)
  dfTableA$dateB <- as.POSIXct.Date(dfTableA$dateB)
  ABcomparison <- rCompare(dfTableA, dfTableB, keys = c("color"))
  expect_true(length(ABcomparison$matches) == 0)
  expect_true(names(ABcomparison$mismatches)[1] == "DATEA")
  expect_true(names(ABcomparison$mismatches)[2] == "DATEB")
  expect_true(all(ABcomparison$mismatches$DATEA$diffAB == ""))
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB == ""))
  
  # Set the matching column in B to Posix - now A/A should match
  dfTableB$dateA <- as.POSIXct.Date(dfTableB$dateA)
  ABcomparison <- rCompare(dfTableA, dfTableB, keys = c("color"))
  expect_true(ABcomparison$matches[1] == "DATEA")
  expect_true(names(ABcomparison$mismatches)[1] == "DATEB")
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB == ""))
  
  
  # Change last column - now it musmatches due to differences
  dfTableB$dateB <- as.POSIXct.Date(dfTableB$dateB)
  ABcomparison <- rCompare(dfTableA, dfTableB, keys = c("color"))
  expect_true(ABcomparison$matches[1] == "DATEA")
  expect_true(names(ABcomparison$mismatches)[1] == "DATEB")
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB < 0))
  expect_true(all(ABcomparison$mismatches$DATEB$diffAB > -21))
})
