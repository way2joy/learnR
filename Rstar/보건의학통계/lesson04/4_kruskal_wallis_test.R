setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson04")

dGroup = read.csv("4_kruskal_wallis_test.csv", header=T)
head(dGroup) ; str(dGroup)
dGroup$group <- as.factor(dGroup$group)
plot(dGroup)

# 정규성 검증
tapply(dGroup$score, dGroup$group, shapiro.test)
# http://acpi.tistory.com/33

# Kruskal test
kruskal.test(score~group, data=dGroup)
