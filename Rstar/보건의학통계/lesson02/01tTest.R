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

# t-test([rsc](http://blog.naver.com/PostView.nhn?blogId=kingmbc2&logNo=30105279908&parentCategoryNo=47&viewDate=&currentPage=1&listtype=0))

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


# Shapiro Wilk normality test
# install.packages("nortest")
library(nortest)
shapiro.test(group$'1'$score)   # p-value = 0.1905 > 0.05 ... 정규분포 따른다.
shapiro.test(group$'2'$score)   # p-value = 0.3848 > 0.05 ... 정규분포 따른다.

# plot
boxplot(data.src)

hist(group$'1'$score, freq=FALSE)
lines(density(group$'1'$score))
rug(jitter(group$'1'$score))

hist(group$'2'$score, freq=FALSE)
lines(density(group$'2'$score))
rug(jitter(group$'2'$score))

# http://jinmedi.tistory.com/339
# 두 집단 이상일 때 정규성 검정을 해보아요
# output <- lm(종속변수~독립변수, data=오브젝트이름)
# shapiro.test(resid(output))

output <- lm(score~group, data = data.src)
shapiro.test(resid(output))    # p-value = 0.1066 > 0.05 ... 정규분포 따른다.


