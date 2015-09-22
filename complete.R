complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # preallocate data file for performance
  nFiles <- length(id)
  dfComplete <- data.frame(id=integer(nFiles),nobs=numeric(nFiles))

  # count variable will allow us to add row to preallocated data file
  count <- 0
  
  for (n in id) {
    # create file name by concatenating parts and adding leading zeros
    file <- file.path(directory, paste0(paste(rep("0", 3-nchar(n)), collapse=""), n, ".csv"))
    
    # read file 
    dfFile <- read.table(file, header=TRUE, sep = ",", stringsAsFactors = FALSE)
    
    # create logical vector of complete cases 
    OK <- complete.cases(dfFile)
    
    # use vector to add number of complete cases to data frame
    count <- count + 1
    dfComplete[count,] <- c(n,length(OK[OK]))
  }
  
  return(dfComplete)
}