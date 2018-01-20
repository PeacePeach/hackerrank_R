# Enter your code here. Read input from STDIN. Print output to STDOUT
# Read the input
data <- suppressWarnings(readLines(file("stdin")))

# Split the string and convert it into numeric
my_data <- strsplit(data[2], split = " ", fixed = TRUE)
my_data <- as.numeric(my_data[[1]])

# Function to find the mode
my_mode <- function(dat) {
  # Count table
  myTable <- as.data.frame(table(dat))
  myTable$dat <- as.numeric(levels(myTable$dat))[myTable$dat]
  
  # Sort the table
  myTable <- myTable[order(-myTable$Freq, myTable$dat), ]
  
  # Answer
  myTable[1,1]
}

# Print the answers
writeLines(as.character(mean(my_data)))
writeLines(as.character(median(my_data)))
writeLines(as.character(my_mode(my_data)))
