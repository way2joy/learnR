# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.61
setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson03")
data <- read.csv("3_paired_t_test.csv", header=T)

data$deviation <- data[2]-data[1]
names(data$deviation) <- c("deviation")
head(data)


t.test()