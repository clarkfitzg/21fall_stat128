library(tidyverse)

# Last 5 years of Sacramento
# Setting colClasses = "character" causes all columns to be read in as character.
# This is necessary to preserve the "020" EventCode.
sac = read.csv("~/Downloads/sac_events.csv", colClasses = "character")

# Code lookups
cameo = read.csv("~/Downloads/cameo.csv", colClasses = "character")

# I expected this to have the same number of rows as sac.
sac2 = inner_join(sac, cameo)

dim(sac)
dim(sac2)

common_events = names(tail(sort(table(sac2$EventCode))))

sac %>% filter(EventCode %in% common_events) %>%
  group_by(EventCode, Year) %>%
  summarize(n = n()) %>% 
  inner_join(cameo) ->
  event_years
  
ggplot(event_years, aes(x = Year, y = n, color = EventType, group = EventType)) +
    geom_line() +
    labs(title = "most events around Sacramento are peaceful",
         color = "type of event",
         caption = "Notice that the number of events is decreasing over time. This is probably because of an underlying issue in the data collection.\nA better way to present this data would be to show relatively how many events per years are classified to each EventCode.",
        x = "year",
        y = "number of events") +
    ylim(c(0, NA))

ggsave("event_years.png")
