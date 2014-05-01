# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.81
[ref](http://www.r-tutor.com/elementary-statistics/non-parametric-methods/wilcoxon-signed-rank-test)

## data 전처리
### csv 읽기
setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson03")
data <- read.csv("3_wilcoxon_signed_rank_test.csv", header=T)



library('car')
wilcox.test(data$pre, data$post, paired=T) # p=0.2328 > 0.5
