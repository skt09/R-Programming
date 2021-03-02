pollutantmean <- function(directory, pollutant, id = 1:332) {
  monitors <- list.files(directory, full.names = TRUE)
  monitors <- monitors[id]
  values <- vector()
  
  for (datas in monitors) {
    data <- read.csv(datas)
    d <- data[, pollutant]
    d <- d[!is.na(d)]
    
    values <- c(values, d)
  }
  
  mean(values)
}