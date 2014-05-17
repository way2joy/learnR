

setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson05")

data3 = read.csv("5_cochran_armitage_trend_test.csv", header=T)
head(data3)
data3$obesity <- as.factor(data3$obesity)
data3$diabetes <- as.factor(data3$diabetes)

### Cochran-Armitage test (permutation equivalent to correlation
# https://stat.ethz.ch/pipermail/r-help/2005-November/083554.html
# install.packages('coin')
library("coin")
table(data3$obesity, data3$diabetes)
independence_test(diabetes~obesity, data=data3, teststat = "quad")

?independence_test
