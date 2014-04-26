# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.61

data.src <- read.csv("Rstar/보건의학통계/lesson02/01tTest.csv", header = T, sep = ",")

# 확인
head(data.src)
summary(data.src)

# preprocess
data.src$no <- NULL
data.src$group <- as.factor(data.src$group)

group <- split(data.src, data.src$group)

# plot
plot(density(group$'1'$score))
lines(density(group$'2'$score), lty=2)
group1 <- group$'1'$score
group2 <- group$'2'$score

# t-test([src](http://blog.naver.com/PostView.nhn?blogId=kingmbc2&logNo=30105279908&parentCategoryNo=47&viewDate=&currentPage=1&listtype=0))

## 등분산 검정 : leveneTest
```
library(car)
leveneTest(score~group, data=data.src, center=mean)
# p=0.6461 > 0.05 이므로 등분산이 아니라고 할 수 없다.
# 따라서 등분산 t-test를 사용한다.
```

## 등분산 : Var.equal = T
### 양측검정 : alt = 'two.sided'
t.test(group1, group2, Var.equal=T, alt='two.sided')

### 단측검정 : alt = 'less'
t.test(group1, group2, Var.equal=T, alt='less')

## 등분산 아님 : Var.equal = F
t.test(group1, group2, Var.equal=F, alt='two.sided')

### 양측검정 : alt = 'two.sided'
t.test(group1, group2, Var.equal=T, alt='less')

### 단측검정 : alt= 'less'


