library(tidyverse)
data_in <- "C:/Users/acer/Desktop/OneDrive - Central European University/Courses/Fall_Term/Coding_1/data/Hotels_vienna"
hotels_vienna <- read_csv(paste0(data_in,"/raw/hotelbookingdata-vienna.csv"))

mean(hotels_vienna$price)

sample_n(hotels_vienna, size = 25, replace = FALSE)
sample(hotels_vienna$price, size = 25, replace = FALSE)


z <- c(1,2,3)
counter <- 0
w <- 25
for (val in z)
  {
  y <- sample(hotels_vienna$price, size = w, replace = FALSE)
  counter = counter + 1
  print(paste("For sample size", w, "sampling run number", counter, "the mean is", mean(y)))
}

