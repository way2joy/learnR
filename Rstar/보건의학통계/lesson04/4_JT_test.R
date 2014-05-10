setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson04")

dGroup = read.csv("4_JT_test.csv", header=T)
head(dGroup) ; str(dGroup)
# dGroup$group <- as.factor(dGroup$group)
plot(dGroup)

# install.packages("clinfun")
library(clinfun)
jonckheere.test(dGroup$score, dGroup$group)

