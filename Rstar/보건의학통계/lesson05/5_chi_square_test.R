# http://dermabae.tistory.com/173
# http://mkseo.pe.kr/stats/?p=300

setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson05")

data = read.csv("5_chi_square_test.csv", header=T)
head(data)
data$obesity <- as.factor(data$obesity)
data$diabetes <- as.factor(data$diabetes)

chisq.test(data$obesity, data$diabetes)
