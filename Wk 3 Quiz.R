# Load packages.

packages <- c("data.table", "jpeg")

sapply(packages, require, character.only = TRUE, quietly = TRUE)

# Fix URL reading for knitr

setInternet2(TRUE)


# Question 1
# Create a logical vector that identifies the households on greater than 10 acres who sold more 
# than $10,000 worth of agriculture products. Assign that logical vector to the variable 
# agricultureLogical. Apply the which() function like this to identify the rows of the data frame 
# where the logical vector is TRUE.
#
# which(agricultureLogical)
#
# What are the first 3 values that result?

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

f <- file.path(getwd(), "ss06hid.csv")

download.file(url, f)

dt <- data.table(read.csv(f))

agricultureLogical <- dt$ACR == 3 & dt$AGS == 6

which(agricultureLogical)[1:3]

# [1] 125 238 262

# Question 2
# Using the jpeg package read in the following picture of your instructor into R
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?
#  (some Linux systems may produce an answer 638 different for the 30th quantile)

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

fp <- file.path(getwd(), "jeff.jpg")

dFile <- download.file(url2, fp, mode = "wb")

pic <- readJPEG(fp, native = TRUE)

quantile(pic, probs = c(0.3, 0.8))

#       30%       80% 
# -15259150 -10575416 
