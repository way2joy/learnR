# 10. 분류 알고리즘
## 1. 데이터 탐색
### 1.1 기술통계
#### `summary`를 이용한 기술통계
```
data(iris)
summary(iris)
```

#### describe를 이용한 기술통계
```
install.packages("Hmisc", dep=T)
library(Hmisc)
describe(iris)
```

### 1.2 데이터 시각화
```
plot(iris)
plot(iris$Sepal.Length)
plot(iris$Specise, xlim=50)
```
```
library(caret)
featurePlot(iris[,1:4], iris$Species, "ellipse")
```

## 2. 전처리

### 2.1 데이터 변환

#### 데이터 정규화(Feature Scaling)

```
iris.scaled <- cbind(as.data.frame(scale(iris[1:4])), iris$Species)
```
featurePlot(iris.scaled[,1:4], iris$Species, "ellipse")
```

#### PCA(Principal Componenet Analysis)
```
pca <- princomp(iris[,1:4], cor=TRUE)
summary(pca)
plot(pca, type="lines")
iris.pca <- predict(pca, iris[1:4])
```
#### 범주형 변수의 재표현
범주형 변수가 많은 경우 이를 줄이는 방법
Random Forest의 경우 factor 개수를 32개로 한정하고 있다.

```
all <- factor(c(paste0(LETTERS, "0"), paste0(LETTERS, "1")))
data <- data.frame(lvl=all, value=rnorm(length(all)))
library(randomForest)
m <- randomForest(value ~ lvl, data=data)
```

### 2.2 결측치(NA)의 처리
`complete.cases()` : 각 행에 저장된 모든 값이 NA가 아닐 때만 TRUE를 반환함
`is.na()` : 한 열에 대해서만 조사하고자 할 때

```
iris.na <- iris[!complete.cases(iris),]
```

1) NA가 포함된 데이터 제외하고 모델링

2) NA를 다른 값으로 대체 : 중앙값 혹은 평균값
```
library(DMwR)
centralImputation(iris.na[1:4])    # 중앙값으로 대체
knnImputation(iris.na[1:4])    # knn상 근접이웃의 가중평균으로 대체

### 2.3 변수 선택(Featrue Selection)

주어진 데이터 전체가 아니라 모델링에 가장 적합한 변수만 택하는 과정

- Filter Method : 모델링 기법에 의존하지 않고 데이터의 통계적 특성으로 부터 선택
- Wrapper Method : 일부 변수 모델링을 반복하여 적합한 변수 선택
- Embedded Method : 모델 자체에 변수 선택이 포함됨

#### 0에 가까운 분산(Near Zero Variace)
가장 기본적인 방법
분산이 작은 변수는 모델링에 의미가 없는 원리
caret packages의 nearZeroVar()

```
library(caret)
library(mlbench)
data(Soybean)
nearZeroVar(Soybean, saveMetrics=TRUE)   # "saveMetrics=TRUE" 분석 결과를 표로 출력, 지정하지 않으면 아래와 같이 nearZeroVar에 해당하는 변수 출력
names(Soybean)[nearZeroVar(Soybean)]

mySoybean <- Soybean[,-nearZeroVar(Soybean)]
# 'nzv' 항목이 TRUE인 변수들을 모델링에서 제거한다.
```




