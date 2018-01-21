library(dplyr)
library(stringr)

# We only need data from line 2 and 3
myData <- suppressWarnings(readLines(file("stdin")))
myData <- myData[2]


# Sample Test Case
#myData <- c("10 40 30 50 20")


# Turn the data into numerical vector
myData <- myData %>% 
  str_split(pattern = " ") %>% 
  unlist() %>% 
  as.numeric()


# Create our own population standard deviation as R gives us the sample standard deviation
pop.sd <- function(x) {
  std_dev <- sqrt((var(x) * (length(x) - 1))/length(x))
  return(std_dev)
}


# Print the result
round(pop.sd(myData), 1) %>% as.character() %>% writeLines()

