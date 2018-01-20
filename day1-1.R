# Enter your code here. Read input from STDIN. Print output to STDOUT
data <- suppressWarnings(readLines(file("stdin")))

# Load relevant libraries
library(dplyr)
library(stringr)

# We only need data from line 2. Turn it into a numerical vector
myData <- c(data[2])
myData <- myData %>% str_split(pattern = " ")
myData <- myData %>% unlist() %>% as.numeric()


# Different vector length uses different type/formula for the quantile. Use type 6 when it's odd and 2 when it's even.
var = if_else(length(myData) %% 2 == 1, 6, 2)

# Print the answer 
writeLines(as.character(quantile(myData, 0.25, type = var)))
writeLines(as.character(quantile(myData, 0.5, type = var)))
writeLines(as.character(quantile(myData, 0.75, type = var)))