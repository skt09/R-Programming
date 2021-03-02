complete <- function(directory, id = 1:332) {
  monitors <- list.files(directory, full.names = TRUE)
  
  ids <- vector()
  nobs <- vector()
  
  for (i in id) {
    filename <- sprintf("%03d.csv", i)
    filepath <- paste(directory, filename, sep="/")
    
    data <- read.csv(filepath)
    d <- data[complete.cases(data),]
    
    ids <- c(ids, i)
    nobs <- c(nobs, nrow(d))
  }
  data.frame(id=ids, nobs=nobs)
}