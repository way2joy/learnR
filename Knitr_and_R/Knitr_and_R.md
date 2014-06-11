Knitr
====================================================

knitr customize
----------------------------------------------------

### 5.4.3 knitrBootstrap 스타일링


```r
install.packages("knitrBootstrap")
library(knitrBootstrap)
```


"Knit HTML"버튼과 연동되어 있는  markdownToHTML() 함수 행동 바꾸기

```r
options(rstudio.markdownToHTML = function(inputFile, outputFile) {
    require(knitrBootstrap)
    knit_bootstrap_md(input = inputFile, output = outputFile, chooser = c("boot", 
        "code"), thumbsize = 6)
})
```


knitr option
----------------------------------------------------

code chunk 출력물 6가지

- source code
- graph(plot)
- text
- massage
- warning
- error


### 일반옵션

#### `cache=FALSE`

처음 컴파일 할 때 결과를 저장하고 이후 컴파일 할 때 값이 바뀌지 않으면 재활용함(바뀌면 재계산)

코드의 일부만 실행시킬 수도 있다.

`eval=c(1,5)` : 1, 5 line code만 실행  
`eval=-c(1,5)` : 1, 5 line code 빼고 실행

#### `eval=TRUE`

코드를 실행할지 여부

#### `include=TRUE`

청크 결과물을 변환될 md, HTML 파일에 포함시킬지 여부

#### `label=""`

개별 코드 청크의 이름을 부여함

`{r label="mycode"}`는 `{r mycode}`라고 표현할 수도 있다.

코드를 재사용하는데 활용할 수 있다. (불러낼 때에는 코드 chunk에 아무것도 넣지 않는다.)


```r
a <- c(1, 2, 3, 4)
```



```r
a <- c(1, 2, 3, 4)
```


### 출력물 옵션

### fig

fig.width=7
fig.height=5




