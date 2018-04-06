library(reshape2)
library(dplyr)
library(readr)

data <- read.csv("data/commodity_trade_statistics_data.csv", colClasses = c("year" = "factor")) %>% na.omit() %>%
  filter(as.numeric(as.character(year))>2012,as.numeric(as.character(year))<2017)%>%
  write_rds(path="clean/cleaned.rds")


