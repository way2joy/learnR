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

### 6.2 일반옵션

#### 6.2.1 `cache=FALSE`

처음 컴파일 할 때 결과를 저장하고 이후 컴파일 할 때 값이 바뀌지 않으면 재활용함(바뀌면 재계산)

코드의 일부만 실행시킬 수도 있다.

`eval=c(1,5)` : 1, 5 line code만 실행  
`eval=-c(1,5)` : 1, 5 line code 빼고 실행

#### 6.2.2 `eval=TRUE`

코드를 실행할지 여부

#### 6.2.3 `include=TRUE`

청크 결과물을 변환될 md, HTML 파일에 포함시킬지 여부

#### 6.2.4 `label=""`

개별 코드 청크의 이름을 부여함

`{r label="mycode"}`는 `{r mycode}`라고 표현할 수도 있다.

코드를 재사용하는데 활용할 수 있다. (불러낼 때에는 코드 chunk에 아무것도 넣지 않는다.)


```r
a <- c(1, 2, 3, 4)
```



```r
a <- c(1, 2, 3, 4)
```


### 6.3 출력물 옵션

code chunk 출력물 6가지

- source code
- graph(plot)
- text
- massage
- warning
- error

#### sourcecode 출력 option 

##### `echo=TRUE`

현재의 소스코드를 출력한다.  
`echo=c(3, 5)` : 3번과 5번줄만 출력한다. 

##### `prompt=FALSE`

프롬프트(>)를 출력하지 않는다.

##### `tidy=TRUE`

R 코드가 정리되어 출력되도록 한다.

##### `highlight=TRUE`

구문 강조가 된 코드를 출력되게 한다.

##### `background='#F7F7F7'`

레이텍 출력에서 코드 청크의 배경색을 정한다.

##### `size='normalsize'`

레이텍 출력에서 코드 청크의 폰트 사이즈를 정한다. 

#### text 출력(sourcecode의 결과물) 옵션

##### `comment='##'`

결과값 앞에 ##를 붙여 sourcecode와 구분한다.  
`comment=NA`로 하면 ##를 붙이지 않고 출력한다. 

##### `results='markup'`

마크업 언어의 형태로 변환해 내보낸다.  
`results='asis'` : 있는 그대로 다름 단계로 넘긴다.
`results='hide'` : 결과 자체를 출력하지 않는다.

표 만들기의 예에서, R 코드 실행 결과가 MD으로 바뀌어 HTML로 넘어가기 때문에 결과가 문자열로 출력된다. (R -> MD -> HTML)


```r
library("knitr")
# kable(head(iris))
kable(head(iris))
```

```
## |  Sepal.Length|  Sepal.Width|  Petal.Length|  Petal.Width|Species  |
## |-------------:|------------:|-------------:|------------:|:--------|
## |           5.1|          3.5|           1.4|          0.2|setosa   |
## |           4.9|          3.0|           1.4|          0.2|setosa   |
## |           4.7|          3.2|           1.3|          0.2|setosa   |
## |           4.6|          3.1|           1.5|          0.2|setosa   |
## |           5.0|          3.6|           1.4|          0.2|setosa   |
## |           5.4|          3.9|           1.7|          0.4|setosa   |
```


`results='asis'`로 하면 R 코드 실행 결과를 MD로 바뀌지 않고 그대로 넘기기 때문에 MD -> HTML로 표를 그려 보여준다.

|  Sepal.Length|  Sepal.Width|  Petal.Length|  Petal.Width|Species  |
|-------------:|------------:|-------------:|------------:|:--------|
|           5.1|          3.5|           1.4|          0.2|setosa   |
|           4.9|          3.0|           1.4|          0.2|setosa   |
|           4.7|          3.2|           1.3|          0.2|setosa   |
|           4.6|          3.1|           1.5|          0.2|setosa   |
|           5.0|          3.6|           1.4|          0.2|setosa   |
|           5.4|          3.9|           1.7|          0.4|setosa   |


HTML의 경우도 그러하다. 


```r
# kable(head(iris), format='html')
kable(head(iris, 3), format = "html")
```

```
## <table>
##  <thead>
##   <tr>
##    <th> Sepal.Length </th>
##    <th> Sepal.Width </th>
##    <th> Petal.Length </th>
##    <th> Petal.Width </th>
##    <th> Species </th>
##   </tr>
##  </thead>
## <tbody>
##   <tr>
##    <td> 5.1 </td>
##    <td> 3.5 </td>
##    <td> 1.4 </td>
##    <td> 0.2 </td>
##    <td> setosa </td>
##   </tr>
##   <tr>
##    <td> 4.9 </td>
##    <td> 3.0 </td>
##    <td> 1.4 </td>
##    <td> 0.2 </td>
##    <td> setosa </td>
##   </tr>
##   <tr>
##    <td> 4.7 </td>
##    <td> 3.2 </td>
##    <td> 1.3 </td>
##    <td> 0.2 </td>
##    <td> setosa </td>
##   </tr>
## </tbody>
## </table>
```


<table>
 <thead>
  <tr>
   <th> Sepal.Length </th>
   <th> Sepal.Width </th>
   <th> Petal.Length </th>
   <th> Petal.Width </th>
   <th> Species </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 5.1 </td>
   <td> 3.5 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 3.0 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.7 </td>
   <td> 3.2 </td>
   <td> 1.3 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
</tbody>
</table>


#### message, warning, error

`message=TRUE`

`warning=TRUE`

`error=TRUE`

### 6.5 표 출력하기

* knitr에서 제공하는 kable() 함수를 이용하는 방법

* xtable package를 이용하는 방법

#### 동적 table 만들기

옵션 준비


```r
# vignette('dataTables') 참고
options(markdown.HTML.header = unlist(sapply(system.file("misc", c("vignette.css", 
    "datatables.txt"), package = "knitr"), readLines)))
```


테이블 그리기(테이블에 id 지정)
<table id="iris_table">
 <thead>
  <tr>
   <th> Sepal.Length </th>
   <th> Sepal.Width </th>
   <th> Petal.Length </th>
   <th> Petal.Width </th>
   <th> Species </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td> 5.1 </td>
   <td> 3.5 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 3.0 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.7 </td>
   <td> 3.2 </td>
   <td> 1.3 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.6 </td>
   <td> 3.1 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.6 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.4 </td>
   <td> 3.9 </td>
   <td> 1.7 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.6 </td>
   <td> 3.4 </td>
   <td> 1.4 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.4 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.4 </td>
   <td> 2.9 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 3.1 </td>
   <td> 1.5 </td>
   <td> 0.1 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.4 </td>
   <td> 3.7 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.8 </td>
   <td> 3.4 </td>
   <td> 1.6 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.8 </td>
   <td> 3.0 </td>
   <td> 1.4 </td>
   <td> 0.1 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.3 </td>
   <td> 3.0 </td>
   <td> 1.1 </td>
   <td> 0.1 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 4.0 </td>
   <td> 1.2 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 4.4 </td>
   <td> 1.5 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.4 </td>
   <td> 3.9 </td>
   <td> 1.3 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.5 </td>
   <td> 1.4 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 3.8 </td>
   <td> 1.7 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.8 </td>
   <td> 1.5 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.4 </td>
   <td> 3.4 </td>
   <td> 1.7 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.7 </td>
   <td> 1.5 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.6 </td>
   <td> 3.6 </td>
   <td> 1.0 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.3 </td>
   <td> 1.7 </td>
   <td> 0.5 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.8 </td>
   <td> 3.4 </td>
   <td> 1.9 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.0 </td>
   <td> 1.6 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.4 </td>
   <td> 1.6 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.2 </td>
   <td> 3.5 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.2 </td>
   <td> 3.4 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.7 </td>
   <td> 3.2 </td>
   <td> 1.6 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.8 </td>
   <td> 3.1 </td>
   <td> 1.6 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.4 </td>
   <td> 3.4 </td>
   <td> 1.5 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.2 </td>
   <td> 4.1 </td>
   <td> 1.5 </td>
   <td> 0.1 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 4.2 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 3.1 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.2 </td>
   <td> 1.2 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 3.5 </td>
   <td> 1.3 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 3.6 </td>
   <td> 1.4 </td>
   <td> 0.1 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.4 </td>
   <td> 3.0 </td>
   <td> 1.3 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.4 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.5 </td>
   <td> 1.3 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.5 </td>
   <td> 2.3 </td>
   <td> 1.3 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.4 </td>
   <td> 3.2 </td>
   <td> 1.3 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.5 </td>
   <td> 1.6 </td>
   <td> 0.6 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.8 </td>
   <td> 1.9 </td>
   <td> 0.4 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.8 </td>
   <td> 3.0 </td>
   <td> 1.4 </td>
   <td> 0.3 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 3.8 </td>
   <td> 1.6 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 4.6 </td>
   <td> 3.2 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.3 </td>
   <td> 3.7 </td>
   <td> 1.5 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 3.3 </td>
   <td> 1.4 </td>
   <td> 0.2 </td>
   <td> setosa </td>
  </tr>
  <tr>
   <td> 7.0 </td>
   <td> 3.2 </td>
   <td> 4.7 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 3.2 </td>
   <td> 4.5 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.9 </td>
   <td> 3.1 </td>
   <td> 4.9 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 2.3 </td>
   <td> 4.0 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.5 </td>
   <td> 2.8 </td>
   <td> 4.6 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 2.8 </td>
   <td> 4.5 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 3.3 </td>
   <td> 4.7 </td>
   <td> 1.6 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 2.4 </td>
   <td> 3.3 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.6 </td>
   <td> 2.9 </td>
   <td> 4.6 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.2 </td>
   <td> 2.7 </td>
   <td> 3.9 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 2.0 </td>
   <td> 3.5 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.9 </td>
   <td> 3.0 </td>
   <td> 4.2 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.0 </td>
   <td> 2.2 </td>
   <td> 4.0 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.1 </td>
   <td> 2.9 </td>
   <td> 4.7 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.6 </td>
   <td> 2.9 </td>
   <td> 3.6 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.1 </td>
   <td> 4.4 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.6 </td>
   <td> 3.0 </td>
   <td> 4.5 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 2.7 </td>
   <td> 4.1 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.2 </td>
   <td> 2.2 </td>
   <td> 4.5 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.6 </td>
   <td> 2.5 </td>
   <td> 3.9 </td>
   <td> 1.1 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.9 </td>
   <td> 3.2 </td>
   <td> 4.8 </td>
   <td> 1.8 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.1 </td>
   <td> 2.8 </td>
   <td> 4.0 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 2.5 </td>
   <td> 4.9 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.1 </td>
   <td> 2.8 </td>
   <td> 4.7 </td>
   <td> 1.2 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 2.9 </td>
   <td> 4.3 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.6 </td>
   <td> 3.0 </td>
   <td> 4.4 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.8 </td>
   <td> 2.8 </td>
   <td> 4.8 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.0 </td>
   <td> 5.0 </td>
   <td> 1.7 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.0 </td>
   <td> 2.9 </td>
   <td> 4.5 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 2.6 </td>
   <td> 3.5 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 2.4 </td>
   <td> 3.8 </td>
   <td> 1.1 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 2.4 </td>
   <td> 3.7 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 2.7 </td>
   <td> 3.9 </td>
   <td> 1.2 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.0 </td>
   <td> 2.7 </td>
   <td> 5.1 </td>
   <td> 1.6 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.4 </td>
   <td> 3.0 </td>
   <td> 4.5 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.0 </td>
   <td> 3.4 </td>
   <td> 4.5 </td>
   <td> 1.6 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.1 </td>
   <td> 4.7 </td>
   <td> 1.5 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 2.3 </td>
   <td> 4.4 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.6 </td>
   <td> 3.0 </td>
   <td> 4.1 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 2.5 </td>
   <td> 4.0 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.5 </td>
   <td> 2.6 </td>
   <td> 4.4 </td>
   <td> 1.2 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.1 </td>
   <td> 3.0 </td>
   <td> 4.6 </td>
   <td> 1.4 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 2.6 </td>
   <td> 4.0 </td>
   <td> 1.2 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.0 </td>
   <td> 2.3 </td>
   <td> 3.3 </td>
   <td> 1.0 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.6 </td>
   <td> 2.7 </td>
   <td> 4.2 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 3.0 </td>
   <td> 4.2 </td>
   <td> 1.2 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 2.9 </td>
   <td> 4.2 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.2 </td>
   <td> 2.9 </td>
   <td> 4.3 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.1 </td>
   <td> 2.5 </td>
   <td> 3.0 </td>
   <td> 1.1 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 2.8 </td>
   <td> 4.1 </td>
   <td> 1.3 </td>
   <td> versicolor </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 3.3 </td>
   <td> 6.0 </td>
   <td> 2.5 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 2.7 </td>
   <td> 5.1 </td>
   <td> 1.9 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.1 </td>
   <td> 3.0 </td>
   <td> 5.9 </td>
   <td> 2.1 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 2.9 </td>
   <td> 5.6 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.5 </td>
   <td> 3.0 </td>
   <td> 5.8 </td>
   <td> 2.2 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.6 </td>
   <td> 3.0 </td>
   <td> 6.6 </td>
   <td> 2.1 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 4.9 </td>
   <td> 2.5 </td>
   <td> 4.5 </td>
   <td> 1.7 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.3 </td>
   <td> 2.9 </td>
   <td> 6.3 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 2.5 </td>
   <td> 5.8 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.2 </td>
   <td> 3.6 </td>
   <td> 6.1 </td>
   <td> 2.5 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.5 </td>
   <td> 3.2 </td>
   <td> 5.1 </td>
   <td> 2.0 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 2.7 </td>
   <td> 5.3 </td>
   <td> 1.9 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.8 </td>
   <td> 3.0 </td>
   <td> 5.5 </td>
   <td> 2.1 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 5.7 </td>
   <td> 2.5 </td>
   <td> 5.0 </td>
   <td> 2.0 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 2.8 </td>
   <td> 5.1 </td>
   <td> 2.4 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 3.2 </td>
   <td> 5.3 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.5 </td>
   <td> 3.0 </td>
   <td> 5.5 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.7 </td>
   <td> 3.8 </td>
   <td> 6.7 </td>
   <td> 2.2 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.7 </td>
   <td> 2.6 </td>
   <td> 6.9 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.0 </td>
   <td> 2.2 </td>
   <td> 5.0 </td>
   <td> 1.5 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.9 </td>
   <td> 3.2 </td>
   <td> 5.7 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 5.6 </td>
   <td> 2.8 </td>
   <td> 4.9 </td>
   <td> 2.0 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.7 </td>
   <td> 2.8 </td>
   <td> 6.7 </td>
   <td> 2.0 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 2.7 </td>
   <td> 4.9 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.3 </td>
   <td> 5.7 </td>
   <td> 2.1 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.2 </td>
   <td> 3.2 </td>
   <td> 6.0 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.2 </td>
   <td> 2.8 </td>
   <td> 4.8 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.1 </td>
   <td> 3.0 </td>
   <td> 4.9 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 2.8 </td>
   <td> 5.6 </td>
   <td> 2.1 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.2 </td>
   <td> 3.0 </td>
   <td> 5.8 </td>
   <td> 1.6 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.4 </td>
   <td> 2.8 </td>
   <td> 6.1 </td>
   <td> 1.9 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.9 </td>
   <td> 3.8 </td>
   <td> 6.4 </td>
   <td> 2.0 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 2.8 </td>
   <td> 5.6 </td>
   <td> 2.2 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 2.8 </td>
   <td> 5.1 </td>
   <td> 1.5 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.1 </td>
   <td> 2.6 </td>
   <td> 5.6 </td>
   <td> 1.4 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 7.7 </td>
   <td> 3.0 </td>
   <td> 6.1 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 3.4 </td>
   <td> 5.6 </td>
   <td> 2.4 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.4 </td>
   <td> 3.1 </td>
   <td> 5.5 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.0 </td>
   <td> 3.0 </td>
   <td> 4.8 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.9 </td>
   <td> 3.1 </td>
   <td> 5.4 </td>
   <td> 2.1 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.1 </td>
   <td> 5.6 </td>
   <td> 2.4 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.9 </td>
   <td> 3.1 </td>
   <td> 5.1 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 5.8 </td>
   <td> 2.7 </td>
   <td> 5.1 </td>
   <td> 1.9 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.8 </td>
   <td> 3.2 </td>
   <td> 5.9 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.3 </td>
   <td> 5.7 </td>
   <td> 2.5 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.7 </td>
   <td> 3.0 </td>
   <td> 5.2 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.3 </td>
   <td> 2.5 </td>
   <td> 5.0 </td>
   <td> 1.9 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.5 </td>
   <td> 3.0 </td>
   <td> 5.2 </td>
   <td> 2.0 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 6.2 </td>
   <td> 3.4 </td>
   <td> 5.4 </td>
   <td> 2.3 </td>
   <td> virginica </td>
  </tr>
  <tr>
   <td> 5.9 </td>
   <td> 3.0 </td>
   <td> 5.1 </td>
   <td> 1.8 </td>
   <td> virginica </td>
  </tr>
</tbody>
</table>


해당 id에 javascript 입히기
```
<script type="text/javascript" charset="utf-8">
  $(document).ready(
    function(){
      $('#iris_table').dataTable();
    }
  );
</script>

```
<script type="text/javascript" charset="utf-8">
  $(document).ready(
    function(){
      $('#iris_table').dataTable();
    }
  );
</script>



