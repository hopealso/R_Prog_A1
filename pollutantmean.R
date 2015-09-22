pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  dfPollution <- data.frame(Date=character(0), sulfate=numeric(0), nitrate=numeric(0), ID=integer(0))

  for (n in id) {
    # create file name by concatenating parts and adding leading zeros
    file <- file.path(directory, paste0(paste(rep("0", 3-nchar(n)), collapse=""), n, ".csv"))

    # read file and merge it with master data frame
    dfFile <- read.table(file, header=TRUE, sep = ",", stringsAsFactors = FALSE)
    dfPollution <- rbind(dfFile, dfPollution)
  }
  
  # as only the specified monitors (files) were loaded into dataframe, return mean of entire variable (column)
  return(mean(dfPollution[[pollutant]], na.rm = TRUE))
  
}