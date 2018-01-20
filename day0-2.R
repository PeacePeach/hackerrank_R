# Enter your code here. Read input from STDIN. Print output to STDOUT
data <- suppressWarnings(readLines(file("stdin")))

#Load relevant libraries
library(dplyr)
library(stringr)
library(tibble)

#We only need line 2 and line 3
myData <- c(data[2], data[3])

#Turn the data into a vector, then into a matrix and then into a tibble
myData <- myData %>% str_split(pattern = " ")
myData <- myData %>% 
  unlist() %>% 
  as.numeric() %>% 
  matrix(., ncol = 2, byrow = FALSE) %>% 
  as.tibble() %>% 
  mutate(weighted = V1*V2)

#Calculate the weighted mean
answer <- (sum(myData$weighted)/sum(myData$V2)) %>% round(., 1)

#Print the answer in the format that they wanted 
writeLines(format(answer, nsmall = 1))
