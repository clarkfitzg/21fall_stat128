earn = read.csv("earn.csv")
earn2 = earn[seq(365), c(8, 1, 3, 6, 4)]
write.csv(earn2, "earn2.csv", row.names = FALSE)
