source("complete.R")
corr <- function (directory, threshold=0) {
    completeObservations <- complete(directory)
    completeObservations <- subset(completeObservations, nobs > threshold)
    cr <- c()
    if (nrow(completeObservations) > 0) {
        ids <- completeObservations[["ids"]]
        for (i in ids) {
            if (i < 10) {
                i <- paste("00", i, sep="")
            } else if (i < 100) {
                i <- paste("0", i, sep="")
            }
            data <- read.csv(paste(paste(directory, i, sep="/"), ".csv", sep=""))
            data <- subset(data, !is.na(data[["sulfate"]]))
            data <- subset(data, !is.na(data[["nitrate"]]))
            options(digits=3)
            cr <- rbind(cr, cor(data[["sulfate"]], data[["nitrate"]], use="pairwise.complete.obs"))
        }
    }
    cr
}
