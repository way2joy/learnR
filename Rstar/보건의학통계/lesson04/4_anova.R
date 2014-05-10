setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson04")
# getwd()

dGroup = read.csv("4_anova.csv", header=T)
head(dGroup) ; str(dGroup)
dGroup$group <- as.factor(dGroup$group)

