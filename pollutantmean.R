## pollutantmean.R
## R Programming Assignment 1
## Patrick C. Griffin
## Due February 15, 2015



pollutantmean <- function(directory, pollutant, id = 1:332) {     ## define function

  
  sumValues <- 0                                                  ## initialze variables
  countValues <- 0  
  
  for (i in id) {                                                 ## initiate loop through files
    
    if (i > 332) {                                                ## error check id inputs
      cat("Max id record is 332. Using record(s): ", id[id<=332], "\n")
      break
    }

    textID <- sprintf("%03d", i)                                  ## add leading zeros to ID
    
    fileName <- paste(directory, "/", textID, ".csv", sep = "")   ## create file name string
  
    data <- read.csv(fileName)                                    ## read in csv file
  
    cleanData <- data[!is.na(data[[pollutant]]), ]                ## remove rows with NAs in pollutant col
    
    sumValues <- sumValues + sum(cleanData[[pollutant]])          ## add to totals in each iteration
    countValues <- countValues + length(cleanData[[pollutant]])   
    
  }
          
  round(sumValues/countValues, digits = 3)                        ## calc final avg
  
}