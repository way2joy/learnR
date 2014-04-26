data.A <- c(10, 12, 15, 22,21)
data.B <- c(22, 16, 28, 23)

# Mann-Whitney-Wilcoxon Test([src](http://www.r-tutor.com/elementary-statistics/non-parametric-methods/mann-whitney-wilcoxon-test))

data <- data.frame(data.A, data.B)
tmp.A <- merge("A", data.A)
tmp.B <- merge("B", data.A)
rbind(tmp.A, tmp.B)

