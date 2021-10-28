library(tidyverse)
library(stringr)
library(lubridate)

download.file("https://stat196k-data-examples.s3.amazonaws.com/australia_news.zip", "headlines.zip")
headlines = read.csv(unz("headlines.zip", "abcnews-date-text.csv"))
