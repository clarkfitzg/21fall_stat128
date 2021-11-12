# Announcements:
# 1. Holiday Thursday, Nov 11
# 2. OH changed to 10-12 on Friday, this week only

# Outcomes:
# 1. Understand and ask questions of a new and complex data set
# 2. Demo SQL / "big data" and motivate Spring 2022 Stat 196K

#library(ggplot2)
library(tidyverse)

# Last 5 years of Sacramento
sac = read.csv("~/Downloads/sac_events.csv")

# What are the most common kinds of events?
sort(table(sac$EventCode))

# Code lookups
cameo = read.csv("~/Downloads/cameo.csv")

# I expected this to have the same number of rows as sac.
sac2 = left_join(sac, cameo)

event_years = sac %>% group_by(EventCode, Year) %>%
  summarize( n = n()) %>% 
  inner_join(cameo) %>%
  arrange(n) %>%
  filter(1000 <= n)
  
ggplot(event_years, aes(x = Year, y = n, color = EventType)) + geom_line()


