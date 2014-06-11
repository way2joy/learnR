Title

### 5.4.3 knitrBootstrap 스타일링


```r
install.packages("knitrBootstrap")
```

```
## Installing package into '/home/junho/R/i686-pc-linux-gnu-library/3.1'
## (as 'lib' is unspecified)
```

```
## Error: trying to use CRAN without setting a mirror
```

```r
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




```r
plot(cars)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


