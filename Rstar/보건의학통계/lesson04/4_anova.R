setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson04")
# getwd()

dGroup = read.csv("4_anova.csv", header=T)
head(dGroup) ; str(dGroup)
dGroup$group <- as.factor(dGroup$group)
plot(dGroup)

tapply(dGroup$score, dGroup$group, mean)

# 정규성 검증
tapply(dGroup$score, dGroup$group, shapiro.test)
# http://acpi.tistory.com/33

# 등분산 검정
## bartlett.test
bartlett.test(score~group, data=dGroup)
# p=0.9603 > 0.05 : "분산이 서로 같다."를 기각할 수 없다.
## levene test
library(car)
leveneTest(score~group, data=dGroup, center=mean)

# ANOVA
dG.lm <- lm(score~group, data=dGroup)
anova(dG.lm)

# 잔차의 정규성 검정
dG.res <- resid(dG.lm)
shapiro.test(dG.res)
# p=0.2739 > 0.05 : "정규성을 따른다."를 기각할 수 없다.

# 사후검정
dG.aov <- aov(dG.lm)
TukeyHSD(dG.aov)
