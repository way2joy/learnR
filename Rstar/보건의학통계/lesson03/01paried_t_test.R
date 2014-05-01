# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.61

## data 전처리
### csv 읽기
setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson03")
data <- read.csv("3_paired_t_test.csv", header=T)

### '편차' 정규성 확인을 위해 데이터 생성
data$deviation <- data$post-data$pre
names(data$deviation) <- c("deviation")
head(data)

## 정규성 검정
library(nortest)
shapiro.test(data$pre)  # p=0.5652 > 0.05 정규성 가진다.
shapiro.test(data$post) # p=0.8053 > 0.05 정규성 가진다.
shapiro.test(data$deviation) # p=0.2466 > 0.05 정규성 가진다.

## 대응표본 t-test

t.test(data$pre, data$post, paired=T)  # p=6.327e-10 < 0.05  평균값이 같다고 보기 '매우' 어렵다.

