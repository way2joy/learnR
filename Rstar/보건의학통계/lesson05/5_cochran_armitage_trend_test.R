setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson05")

data3 = read.csv("5_cochran_armitage_trend_test.csv", header=T)
head(data3)
data3$obesity <- as.factor(data3$obesity)
data3$diabetes <- as.factor(data3$diabetes)

