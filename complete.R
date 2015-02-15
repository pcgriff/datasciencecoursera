## complete.R
## R Programming Assignment 1
## Patrick C. Griffin
## Due February 15, 2015


complete <- function(directory, id = 1:332) { 
                                      
  idList <- NULL                                                  ## initialize vectors
  completeList <- NULL
  
  for (i in id) {                                                 ## initiate loop through files
    
    if (i > 332) {                                                ## error check id inputs
      cat("Max id record is 332. Using record(s): ", id[id<=332], "\n")
      break
    }
    
    textID <- sprintf("%03d", i)                                  ## add leading zeros to ID
    
    fileName <- paste(directory, "/", textID, ".csv", sep = "")   ## create file name string
    
    data <- read.csv(fileName)                                    ## read in csv file
    
    numComplete <- sum(complete.cases(data))                      ## count number of complete rows
  
    idList <- c(idList,i)                                         ## append new entries to vectors
    completeList <- c(completeList, numComplete)    
  
  }
  
  ## combine vectors into a data frame
  completeTable <- data.frame(idList, completeList, stringsAsFactors=FALSE)
  names(completeTable) <- c("id", "nobs")
  completeTable
}