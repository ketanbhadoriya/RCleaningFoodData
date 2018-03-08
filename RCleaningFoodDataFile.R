#Cleaning Food Data

#Importing the DataSet
library(RCurl)
url <- "https://assets.datacamp.com/production/course_1294/datasets/food.csv"

x <- getURL(url)
food_df <- read.csv(textConnection(x))
dim(food_df)

# View summary of food
summary(food_df)

# View head of food
head(food_df)

# View structure of food
str(food_df)

#To get the whole summary
library(dplyr)
glimpse(food_df)
names(food_df)

# Define vector of duplicate cols
duplicates <- c(4, 6, 11, 13, 15, 17, 18, 20, 22, 
                24, 25, 28, 32, 34, 36, 38, 40, 
                44, 46, 48, 51, 54, 65, 158)

# Remove duplicates from food: food2
food2 <- food_df[, -duplicates]

# Define useless vector
useless <- c(1, 2, 3, 32:41)

# Remove useless columns from food2: food3
food3 <- food2[,-(useless)]

library(stringr)

# Create vector of column indices: nutrition
nutrition <- str_detect(names(food3), "100g")

# View a summary of nutrition columns
summary(food3[, nutrition])


###
# Find indices of sugar NA values: missing
missing <- which(is.na(food3$sugars_100g))

# Replace NA values with 0
food3$sugars_100g[missing] <- 0

# Create first histogram
hist(food3$sugars_100g, breaks = 100)

# Create food4
food4 <- food3[food3$sugars_100g > 0, ]

# Create second histogram
hist(food4$sugars_100g, breaks = 100)
