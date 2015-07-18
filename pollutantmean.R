pollutantmean <- function (directory, pollutant, id=1:332) {
    means <- c()
    data <- c()
    for (i in id) {
        if (i < 10) {
            i <- paste("00", i, sep="")
        } else if (i < 100) {
            i <- paste("0", i, sep="")
        }
        data <- rbind(data, read.csv(paste(paste(directory, i, sep="/"), ".csv", sep=""), sep=",", header=TRUE))
    }
    as.numeric(format(mean(data[[pollutant]], na.rm=TRUE), digits=4))
}
