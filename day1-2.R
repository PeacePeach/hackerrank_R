library(dplyr)
library(stringr)

# We only need data from line 2 and 3
myData <- suppressWarnings(readLines(file("stdin")))
myData <- c(myData[2], myData[3])

# Sample Test Case
#myData <- c("6 12 8 10 20 16", "5 4 3 2 1 5")

# Turn myData into a tibble
myData <- myData %>% 
  str_split(pattern = " ") %>% 
  unlist() %>% 
  as.numeric() %>% 
  matrix(ncol = 2, byrow = FALSE) %>% 
  as_tibble()

# Rename the column names
colnames(myData) <- c("value", "frequency")

# Create vector
size <- sum(myData$frequency)
myVector <- vector("integer", size)
pos = 1

# Function to fill in the vector
fillVector <- function(val, freq, pos) {
  for (i in 1:freq) {
    myVector[pos] = val
    pos = pos + 1
  }
  return (myVector)
}

# Go through each row of the tibble
for (i in 1:nrow(myData)) {
  a <- myData[[i, 1]]
  b <- myData[[i, 2]]
  myVector <- fillVector(a, b, pos)
  pos <- pos + b
}

# Print the result depending on the length of the vector
var <- if_else(length(myVector) %% 2 == 1, 6, 2)
writeLines(format(quantile(myVector, 0.75, type = var) - quantile(myVector, 0.25, type = var), nsmall = 1))


