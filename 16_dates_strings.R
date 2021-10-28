library(tidyverse)
library(stringr)
library(lubridate)

download.file("https://stat196k-data-examples.s3.amazonaws.com/australia_news.zip", "headlines.zip")

headlines = read.csv(unz("headlines.zip", "abcnews-date-text.csv"))

dim(headlines)

head(headlines)

# Let's see if we can find the years when the Olympics happened.

headlines$olympic = str_detect(headlines$headline_text, "olympic")

# How can we check that it worked?
sum(headlines$olympic)

head(headlines[headlines$olympic, ])

headlines$date = ymd(headlines$publish_date)
headlines$year = year(headlines$date)

table(headlines$year)

# https://stackoverflow.com/questions/27606427/summarizing-a-data-frame-for-graphing-in-ggplot2

olympic_years = headlines %>% group_by(year) %>% summarize(olympic = mean(olympic))

ggplot(olympic_years, aes(x = year, y = olympic)) + geom_line()


# Some people do it like this:
headlines %>% 
    group_by(year) %>% 
    summarize(olympic = sum(olympic)) %>% 
    ggplot(., aes(x = year, y = olympic)) + 
    geom_line() +
    ylab("number of news articles mentioning Olympics")
