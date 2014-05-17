# https://stat.ethz.ch/pipermail/r-help/2005-November/083554.html

setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson05")

data3 = read.csv("5_cochran_armitage_trend_test.csv", header=T)
head(data3)
data3$obesity <- as.factor(data3$obesity)
data3$diabetes <- as.factor(data3$diabetes)

table(lungtumor$dose, lungtumor$tumor)

0  1
0 38  2
1 43  7
2 33 15
R>
  R> ### Cochran-Armitage test (permutation equivalent to correlation
  R> ### between dose and tumor), cf. Table 2 for results
  R> independence_test(tumor ~ dose, data = lungtumor, teststat = "quad")

Asymptotic General Independence Test
