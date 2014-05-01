# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.81
[ref](http://www.r-tutor.com/elementary-statistics/non-parametric-methods/wilcoxon-signed-rank-test)

## data 전처리
### csv 읽기
setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson03")
data <- read.csv("3_wilcoxon_signed_rank_test.csv", header=T)

## 정규성 검정 : 표본 수가 작으므로 (30이하) 정규성이 업다고 판단하고 정규성 검정을 하지 않는다. 하지만 정규성 검정을 하면 정규성을 따른다고 나온다. 
shapiro.test(data$pre)  # p=0.8244 > 0.05 정규성 가진다.
shapiro.test(data$post) # p=0.7282 > 0.05 정규성 가진다.

## wilcoxon signed rank test
### 그림으로 살펴보자.
plot(density(data$pre))
lines(density(data$post), lty=2)

boxplot(data$pre, data$post, col="yellow3")
segments(1, data$pre, 2, data$post, col=2, lwd=0.5)

## wilcoxon signed rank test 값을 구해보자
library('car')
wilcox.test(data$pre, data$post, paired=T) # p=0.2328 > 0.5
# 다음과 같이 해도 값이 같다.
wilcox.test(data$post-data$pre)
