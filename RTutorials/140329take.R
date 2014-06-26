# IDG Deep Dive 빅 데이터로 가는 지름길 초보자를 위한 R 입문 가이드

setwd("~/Dropbox/CodeBox/RTutorials")

# 설치된 package보기
installed.packages()
paklist <- installed.packages()
str(paklist);summary(paklist);head(paklist)

# package 설치 및 업데이트
install.packages("ggplot2")
# remove.packages("thepackagename")
update.packages()

# 함수 도움말 보기
?plot   # data 함수에 대한 설명
??plot   # == help.search("plot")
example(plot)

# 외부 데이터 불러오기 ... read.csv / read.table
mydata <- read.csv("filename.txt")
mydata <- read.table("filename.txt", sep=",", header=TRUE, stringsAsFactor=TRUE)
mydata <- read.table(file="clipboard", sep=",", header=TRUE)
mydata <- read.csv(file.choose())  # 파일 이름으로 고르기

mydata <- read.csv("http://pewresearch.org")

# [예제] 주식가격 분석
install.packages('quantmod')
library('quantmod')
getSymbols('AAPL')
barChart(AAPL)

barChart(AAPL, subset='last 14 days')
chartSeries(AAPL, subset='last 14 days')

# 메모리에서 변수 제거
rm(AAPL)

# 작업한 전체 워크스페이스 저장
save.image()

# 데이터 보기
data(iris)
myiris <- iris
head(myiris, n=10)
tail(myiris, n=10)
str(myiris)    # 데이터 구조 표현
colnames(myiris)
rownames(myiris)

# 데이터의 통계적 요약 보기
# 1) built in
summary(myiris) 
mean(myiris$Sepal.Length, na.rm=TRUE)
median(myiris$Sepal.Length)
min(myiris$Sepal.Length);max(myiris$Sepal.Length)
sd(myiris$Sepal.Length);var(myiris$Sepal.Length)
range(myiris$Sepal.Length)
cor(myiris[,-5])

# 2) package : psych 
# install.packages("psych")
library("psych")
describe(myiris)

# 컴비네이션
choose(5, 2)
combn(c('Bob', 'Joe', 'Sally', 'Tim', 'Neal'), 2)

# data.frame에서의 data 선택
# 1) 영역에따라 
data(mtcars)
mtcarts.colnames <- names(mtcars)
mtcars[,2:4]
mtcars[,c(2,4)]
mtcars[2:4,]
mtcars[c(2,4),]
mtcars[,-c(2, 4)]

# 2) 조건에 따라
mtcars$mpg > 30
mtcars[mtcars$mpg>30,]
mtcars[mtcars$mpg>30,c(1,4)]
mtcars[mtcars$mpg>30,c("mpg","hp")]    # == subset(mtcars, mpg>30, c("mpg","hp"))

# 지수 별 개수
table(myiris$Species)
table(myiris$Species, myiris$Petal.Length)

# 시각화
plot(mtcars$disp, mtcars$mpg, xlab="Engine displacement", ylab="mpg", main="MPG campared with engine displacement", las=1)    # las ... label stype의 방향을 설정한다. (0~2)
?par

install.packages("ggplot2")
library('ggplot2')
qplot(disp, mpg, data=mtcars)    # quick plot / ylim=c(0,35)을 추가해 보자
plot(mtcars$disp, mtcars$mpg)    # builtin으로 그리면...

ggplot(mtcars, aes(x=disp, y=mpg)) + geom_point()    # aes : 미관(aesthtics) / geom : 선, 막대 등 도식화 구조
mygg <- ggplot(mtcars, aes(x=disp, y=mpg))
mygg + geom_line() + geom_point()

# barchart
data(BOD)
barplot(BOD$demand, main='Graph of demand', names.arg=BOD$Time)

data(mtcars)
barplot(table(mtcars$cyl))
plot(table(mtcars$cyl))
qplot(mtcars$cyl)
qplot(factor(mtcars$cyl))
ggplot(mtcars, aes(factor(cyl))) + geom_bar()

# histogram
hist(mtcars$cyl)
# barchart는 factor에 대한 빈도를 나타내고, histogram은 numeric을 일정하게 나누고 그 영역에 해당하는 빈도를 나타낸다. 
# hist(factor(mtcars$cyl)) ---> Error in hist.default(factor(mtcars$cyl)) : 'x' must be numeric

# histogram에는 영역을 몇가지로 나눌 것인지에 대한 breaks를 지정한다. 
hist(mtcars$mpg, breaks = 10)
qplot(mpg, data=mtcars, binwidth= 4)   # binwidth는 breaks와 상대적인 개념이다. 
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth= 4)

# boxplot
data(diamonds)
boxplot(diamonds$x, diamonds$y, diamonds$z)


# Scatterplots with qplot()
# We see that Iris setosa flowers have the narrowest petals.
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
# By setting the alpha of each point to 0.7, we reduce the effects of overplotting.
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.7))
#let’s fix the axis labels and add a title to the plot.
qplot(Sepal.Length, Petal.Length, data = iris, color = Species,
      xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Fisher's Iris data")



# 색깔 넣기
rainbow(5)
heat.colors(5)
terrain.colors(5)
topo.colors(5)
cm.colors(5)

mycolors <- rainbow(3)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(fill=mycolors)

testscores <- c(96,71,85,92,82,78,72,81,68,61,78,86,90)
barplot(testscores)

testscores.sorted <- sort(testscores, decreasing =TRUE)
testcolors <- ifelse(testscores.sorted >= 80, "blue", "red")
barplot(testscores.sorted, col=testcolors, ylim=c(0,100))


