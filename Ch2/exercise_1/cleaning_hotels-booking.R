library(tidyverse)

# Import raw data
data_in <- "C:/Users/acer/Desktop/OneDrive - Central European University/Courses/Fall_Term/Coding_1/data/Hotels_booking"
hotels_europe <- read_csv(paste0(data_in,"/raw/hotelbookingdata.csv"))

# View data table
View(hotels_europe)
glimpse(hotels_europe)

# Filter for Amsterdam
hotels_europe <- rename(hotels_europe, city=s_city)
hotels_amsterdam <- filter(hotels_europe, city == "Amsterdam")
glimpse(hotels_amsterdam)
hotels_amsterdam <- subset(hotels_amsterdam, select = -c(city, addresscountryname))

# Standardize accommodationtype column
hotels_amsterdam <- separate(hotels_amsterdam, accommodationtype, "@",
                   into = c("garbage","accommodation_type"))
hotels_amsterdam <- subset(hotels_amsterdam, select = -garbage)

# Standardize distance values
hotels_amsterdam <- separate(hotels_amsterdam, center1distance, " ",
                             into = c("dist_from_cityCenter"))
hotels_amsterdam$dist_from_cityCenter
hotels_amsterdam$dist_from_cityCenter <- as.numeric(hotels_amsterdam$dist_from_cityCenter)
typeof(hotels_amsterdam$dist_from_cityCenter)

hotels_amsterdam <- separate(hotels_amsterdam, center2distance, " ",
                             into = c("dist_from_Montelbaanstoren"))
hotels_amsterdam$dist_from_Montelbaanstoren
hotels_amsterdam$dist_from_Montelbaanstoren <- as.numeric(hotels_amsterdam$dist_from_Montelbaanstoren)
typeof(hotels_amsterdam$dist_from_Montelbaanstoren)

hotels_amsterdam <- subset(hotels_amsterdam, select = -center1label)
hotels_amsterdam <- subset(hotels_amsterdam, select = -center2label)
view(hotels_amsterdam)

# Create variable for number of nights
hotels_amsterdam <- mutate(hotels_amsterdam,
                           num_nights = as.numeric(gsub("[^0-9]", "", price_night)))
hotels_amsterdam <- subset(hotels_amsterdam, select = -price_night)

# Labeling missing values accordingly
hotels_amsterdam <- rename(hotels_amsterdam, stars = starrating)
hotels_amsterdam <- mutate(hotels_amsterdam, stars = na_if(stars, 0))
    # no missing values were found for the case of stars

# Deleting missing values for ratingta (it would have only been necessary to delete either of their missing values since they are directly related)
hotels_amsterdam <- filter(hotels_amsterdam, !is.na(rating2_ta))
hotels_amsterdam <- filter(hotels_amsterdam, !is.na(rating2_ta_reviewcount))

# Deleting duplicates (exact matches; could have also filtered by specific variables, but all variables seem to contribute to an unique identifier)
hotels_amsterdam <- filter(hotels_amsterdam, !duplicated(hotels_amsterdam))

## The resulting table represents cross-section time series (panel) data on all Amsterdam hotel bookings
write_csv(hotels_amsterdam, paste0(data_in,
                               "/clean/hotel_amsterdam.csv"))
view(hotels_amsterdam)
