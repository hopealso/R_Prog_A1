corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  # create data frame of complete cases for all the files
  dfComplete <- complete("specdata")
  str(dfComplete)
  
  # create data frame of qualifying files with num of complete cases above threshold
  dfQualified <- dfComplete[dfComplete$nobs>threshold,]
  print(dfQualified$id)
  print(str(dfQualified$id))
  
  for (n in dfQualified$id) {
    # create file name by concatenating parts and adding leading zeros
    file <- file.path(directory, paste0(paste(rep("0", 3-nchar(n)), collapse=""), n, ".csv"))
    print(file)
          
    # read file 
    # dfFile <- read.table(file, header=TRUE, sep = ",", stringsAsFactors = FALSE)

    
  }
  
  # return(dfQualified)
}