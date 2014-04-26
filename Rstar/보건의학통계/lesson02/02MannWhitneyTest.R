# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.65

## 주어진 데이터

data.A <- c(10, 12, 15, 22,21)
data.B <- c(22, 16, 28, 23)

# Mann-Whitney-Wilcoxon Test([src](http://www.r-tutor.com/elementary-statistics/non-parametric-methods/mann-whitney-wilcoxon-test))

## data 만들기
data <- data.frame(data.A, data.B)
tmp.A <- merge("A", data.A)
tmp.B <- merge("B", data.A)
data <- rbind(tmp.A, tmp.B)

wilcox.test(y~x, data=data) 