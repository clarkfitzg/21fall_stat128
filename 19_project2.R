# Announcements:
# 1. Holiday Thursday, Nov 11
# 2. OH changed to 10-12 on Friday, this week only

# Outcomes:
# 1. Understand and ask questions of a new and complex data set
# 2. Demo SQL / "big data" and motivate Spring 2022 Stat 196K

oct15 = read.csv("~/Downloads/20211015.export.CSV")
# Did it work?
# No, just look at it.
# No errors, but still messed up.

# What's this "\t" business?
print("hello\tthere.")

cat("hello\tthere.")

# What is text anyways?
# ASCII, Unicode?

oct15 = read.table("~/Downloads/20211015.export.CSV", sep = "\t")
# Why doesn't line 157 have 58 elements?

# Easiest solution: Upgrade your table reader!
oct15 = readr::read_tsv("~/Downloads/20211015.export.CSV", col_names = FALSE)

# Seems like it's working, but we don't have column names :(
head(oct15)

############################################################

# Let's try the results from Google's BigQuery.
# I don't want the students to have to set up BigQuery accounts...
# but they could if they wanted to.

# Some rows matching "Sacramento"
sac = read.csv("~/Downloads/bq-results-20211108-140607-q2z035xvwo1z.csv")

# Yeah, this looks good, reads right in with no problem.
dim(sac)

# The goal is to come up with a dataset where they could do some kind of regression.
# I'll need more informative columns if we're going to do that.

# What codes do we have?
# We can see them in the docs here:
# http://data.gdeltproject.org/documentation/GDELT-Data_Format_Codebook.pdf

# complete raw CAMEO code (Need lookups)
sac[, c("Actor1Code", "Actor1CountryCode", "Actor1Type1Code")]

# This Actor1Code doesn't look so helpful.


# Human readable:
sac$Actor1Name

# 58 fields per record

# Questions we could ask:
# What kinds of events are important?
# Is there a seasonality to events?
# Is one day of the week better or worse than another?

# Looking at EthnicCode: How has the tone of race changed over time?
sac$Actor1EthnicCode
# Except they're all missing for Sacramento!

# I could pull out all the columns that seem like they would lend themselves to a good data analysis.

# Definitely need joins to understand EventCode
sac$EventCode

# Prediction things...

# https://blog.gdeltproject.org/gdelt-2-0-our-global-world-in-realtime/
# GDELT 2.0 also brings with it the debut of GDELT Global Content Analysis Measures (GCAM), representing what we believe is the largest deployment of sentiment analysis in the world: bringing together 24 emotional measurement packages that together assess more than 2,300 emotions and themes from every article in realtime, multilingual dimensions natively assessing the emotions of 15 languages (Arabic, Basque, Catalan, Chinese, French, Galician, German, Hindi, Indonesian, Korean, Pashto, Portuguese, Russian, Spanish, and Urdu). GCAM is designed to enable unparalleled assessment of the emotional undercurrents and reaction at a planetary scale by bringing together an incredible array of dimensions, from LIWC’s “Anxiety” to Lexicoder’s “Positivity” to WordNet Affect’s “Smugness” to RID’s “Passivity”.

# Whoa, this is cool!

# Last 5 years of Sacramento
sac = read.csv("~/Downloads/bq-results-20211109-094853-ednngpsvgueb.csv")

