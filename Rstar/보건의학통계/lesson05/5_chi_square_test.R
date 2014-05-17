# http://dermabae.tistory.com/173
# http://mkseo.pe.kr/stats/?p=300

setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson05")

data = read.csv("5_chi_square_test.csv", header=T)
head(data)
data$obesity <- as.factor(data$obesity)
data$diabetes <- as.factor(data$diabetes)

chisq.test(data$obesity, data$diabetes)

# Two things to remember:
## – If the number of samples is small in 2×2 contingency table, we need to use fisher.test() for fisher’s exact testing. It uses hypergeometric distribution instead of chi square for more accurate test.
## – If samples are paired (like measurement for the same person before and after of treatment or like rating change before and after election campaign), we need to use mcnemar.test(). But even in mcnemar.test(), if the expected count is small, we need to use binom.test() to see if there’s any difference.

# cf) 
mcnemar.test(data$obesity, data$diabetes)

# cf)
fisher.test(data$obesity, data$diabetes)
