setwd("~/SparkleShare/learnR/Rstar/보건의학통계/lesson04")
# getwd()

read.csv("4_anova.csv")

setwd("/home")

setwd(parent.frame(2)$ofile)

sys.frame(1)$ofile

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
knitr:::input_dir()
setwd (my.own.path ()) 

script.dir <- dirname(sys.frame(1)$ofile)
