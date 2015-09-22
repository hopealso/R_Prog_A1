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
  
  dfPollution <- data.frame(matrix(nrow=length(id), ncol=4))
  names(dfPollution) <- c("Date","sulfate","nitrate","ID")
  print(dfPollution)
  
  for (n in id) {
    # create file name by concatenating parts and adding leading zeros
    file <- file.path(directory, paste0(paste(rep("0", 3-nchar(n)), collapse=""), n, ".csv"))
    print(file)
    
    # read file and merge it with master data frame
    dfFile <- read.table(file, header=TRUE, sep = ",")
    print(paste("Rows - ", nrow(dfFile)))
    
    dfPollution <- rbind(dfFile, dfPollution)
    print(paste("Total Rows - ", nrow(dfPollution)))
  }
  
}