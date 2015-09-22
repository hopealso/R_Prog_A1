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
  
  nFiles <- length(id)
  print(paste("Num Files - ",nFiles))
  dfComplete <- data.frame(id=integer(nFiles),nobs=numeric(nFiles))
  
  for (n in id) {
    # create file name by concatenating parts and adding leading zeros
    file <- file.path(directory, paste0(paste(rep("0", 3-nchar(n)), collapse=""), n, ".csv"))
    
    # read file and merge it with master data frame
    dfFile <- read.table(file, header=TRUE, sep = ",", stringsAsFactors = FALSE)
    
    OK <- complete.cases(dfFile)
    # print(paste("Class -",class(OK)))
    # print(paste("dfFile Str -", str(dfFile)))
    # print(paste("dfFile Str -", str(OK)))
    print(file)
    print(n)
    print(length(OK[OK]))
    
    # dfComplete <- rbind(dfComplete, 
    #                    data.frame(id=n, nobs=length(OK[OK])))
  }
  
  
}