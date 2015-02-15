## corr.R
## R Programming Assignment 1
## Patrick C. Griffin
## Due February 15, 2015

corr <- function(directory, threshold = 0) {
  
  corList <- numeric()                                            ## initialize correlation vector
  
  for (fileName in list.files(directory)) {                       ## loop through ALL files in directory
    
    textName <- paste(directory, "/", fileName, sep = "")         ## create file name string
    
    data <- read.csv(textName)                                    ## read in csv file

    completeData <- data[complete.cases(data), ]
    
    if (nrow(completeData) >= threshold) {                        ## only calc correl if meets threshold
      
      correl <- cor(completeData$nitrate, completeData$sulfate)
      
      corList <- c(corList, correl)                               ## append new entries
      
    }
    
  }
  
  corList
  
}