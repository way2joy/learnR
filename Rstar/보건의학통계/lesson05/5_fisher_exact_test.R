# http://dermabae.tistory.com/175
# http://mkseo.pe.kr/stats/?p=300

setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson05")

data2 = read.csv("5_fisher_exact_test.csv", header=T)
head(data2)
data2$obesity <- as.factor(data2$obesity)
data2$diabetes <- as.factor(data2$diabetes)

fisher.test(data2$obesity, data2$diabetes)
