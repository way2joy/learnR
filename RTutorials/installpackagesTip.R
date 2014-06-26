update.packages()
pk.raw <- installed.packages()
pk <- as.data.frame(pk.raw)
pk.old <- pk[pk$Built!="3.1.0"&pk$Built!="3.0.0",]
pk.outofdate <- unique(pk.old$Package)
pk.outofdate

install.packages(pk.outofdate)

update.packages(checkBuilt = TRUE, ask = FALSE)


