

dGroup = read.csv("4_JT_test.csv", header=T)
head(dGroup) ; str(dGroup)
dGroup$group <- as.factor(dGroup$group)
plot(dGroup)