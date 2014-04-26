# <그림으로 이해하는 닥터 배의 술술 보건의학통계> p.65

## 주어진 데이터

data.A <- c(10, 12, 15, 22,21)
data.B <- c(23, 16, 28, 23)

# Mann-Whitney-Wilcoxon Test
[src](http://www.r-tutor.com/elementary-statistics/non-parametric-methods/mann-whitney-wilcoxon-test)
[src](http://dogmas.tistory.com/182)

### 관련 데이터 직접 사용
```
wilcox.test(data.A, data.B)
# p=0.06506 > 0.05 이므로 
```
### formula 이용
#### data 만들기
tmp.A <- merge("A", data.A)
tmp.B <- merge("B", data.B)
group <- as.data.frame(rbind(tmp.A, tmp.B))
group
wilcox.test(y~x, data=group) 
