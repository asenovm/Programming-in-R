complete <- function (directory, id = 1:332) {
    data <- c()
    ids <- c()
    nobs <- c()
    for(i in id) {
        counter <- i
        if (i < 10) {
            i <- paste("00", i, sep="")
        } else if (i < 100) {
            i <- paste("0", i, sep="")
        }
        data <- read.csv(paste(paste(directory, i, sep="/"), ".csv", sep=""))
        ids <- c(ids, counter)
        filteredData <- subset(data, !is.na(data[["sulfate"]]))
        filteredData <- subset(filteredData, !is.na(filteredData[["nitrate"]]))
        nobs <- c(nobs, nrow(filteredData))
    }
    data.frame(ids, nobs)
}

complete("specdata", 30:25)
