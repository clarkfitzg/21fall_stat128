library(tidyverse)
library(stringr)
library(lubridate)

# Data source: https://www.kaggle.com/therohk/million-headlines
download.file("https://stat196k-data-examples.s3.amazonaws.com/australia_news.zip", "headlines.zip")
headlines = read.csv(unz("headlines.zip", "abcnews-date-text.csv"))

# 123 GO:
# What is one thing I should check when I load in a data set?

# dimensions
dim(headlines)

# first few observations
head(headlines)

# Structure
str(headlines)

# try to convert to date
first6 = headlines[1:6, "publish_date"]

as.Date(first6)

# Dates are a pain.

# 123 GO's
# 1. Are there always 365 days in a year? No... leap years
# 2. Are there always 24 hours in a day? No... daylight savings
# 3. Are there always 60 seconds in a minute? No... There are leap seconds

# use builtin date objects
# Convert into a date object
x = lubridate::ymd(first6)

lubridate::ydm(212810)

headlines$date = lubridate::ymd(headlines$publish_date)
headlines$year = year(headlines$date)

# 123 GO: What else might I extract from the date?
weekdays(x)
# When does new tend to be published in Australia?
plot(table(weekdays(headlines$date)))

# olympics
# process the strings using stringr
h6 = headlines[1:6, "headline_text"]

# aust
str_detect(h6, "aust")

# 123 GO: 
any(str_detect(h6, "olympic"))

headlines$olympic = str_detect(headlines$headline_text, "olympic")

# 123 GO- how can I check this worked?
# How can I find how many olympic headlines are out there?
sum(headlines$olympic)

# Looks at the first few:
head(headlines[headlines$olympic, ])

# Create the data frame necessary for the plot
# dplyr stuff
olympic_year = headlines %>% group_by(year) %>% summarize(count_olympics = sum(olympic))

ggplot(olympic_year, aes(x = year, y = count_olympics)) + geom_line()

# Alternative syntactic / stylistic ways to write this:

# %>% this is called a "pipe" because it behaves similarly to | in bash
# think of it as a "data processing pipeline"

headlines %>% 
  group_by(year) %>% 
  summarize(count_olympics = sum(olympic)) %>%
  ggplot(., aes(x = year, y = count_olympics)) +
  geom_line()

# All same:
sin(pi)
pi %>% sin(.)
pi %>% sin()

