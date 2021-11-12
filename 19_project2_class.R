# 123 GO:
# What will you do on Thursday?

# Announcements:
# 1. Holiday Thursday, Nov 11
# 2. OH changed to 10-12 on Friday, this week only

# Outcomes:
# 1. Understand and ask questions of a new and complex data set
# 2. Demo SQL / "big data" and motivate Spring 2022 Stat 196K
#  "Analyzing and Processing big data" - SQL, bash, Python, cloud computing (AWS)

library(tidyverse)

# Load in this data.
sac = read.csv("~/Downloads/sac_events.csv")

# What are the first few URL's?
head(sac$SOURCEURL)

# Thousands of rows
nrow(sac) / 1e3

# What kind of events are common in Sacramento?
# Always be "touching" your data.
head(sac$EventCode)

# We need the meanings of the CAMEO codes
cameo = read.csv("~/Downloads/cameo.csv")

# %>% is the pipe
cameo %>% filter(EventCode == 193)

# Equivalently:
filter(cameo, EventCode == 193)

# We have EventCode as a column in sac
# We WANT EventType as a column in sac
# Concept: join cameo to sac
# 
# sac has a TON of data, all our data.
# cameo just has the definitions for the code- finite, small.
# cameo is sometimes called a "lookup table", or a "crosswalk"
# 
# 123 GO:
# Why store it like this?

# 123 GO:
# How many columns will sac2 have?
# We'll use a join to bring the two tables together
sac2 = inner_join(sac, cameo)

sac2[1, ]

# Why are there 190K rows in sac2?
# In sac, each row corresponds to an event.
colnames(sac)

# What are the most common events?
sort(table(sac2$EventType))

# What are these "USE UNCONVENTIONAL MASS VIOLENCE" events?
umv = sac2 %>% filter(EventType == "USE UNCONVENTIONAL MASS VIOLENCE")

head(umv$SOURCEURL)

# Why are 3 and 4 repeated?
umv[c(3, 4), ] %>% select(GLOBALEVENTID, EventCode)

cameo %>% filter(EventCode == 20)
