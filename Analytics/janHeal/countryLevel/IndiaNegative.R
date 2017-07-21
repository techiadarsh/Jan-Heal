library(sp)
library(RColorBrewer)
ind1=readRDS("/Users/kartiksharma/Downloads/IND_adm1.rds")
ind1$NAME_1 = as.factor(ind1$NAME_1)
ind1$fake.data = runif(length(ind1$NAME_1))
col_no = as.factor(as.numeric(cut(ind1$fake.data, c(0,0.2,0.4,0.6,0.8,1))))
levels(col_no) = c("9-10", "7-8", "5-6","3-4", "1-2")
ind1$col_no = col_no
myPalette = brewer.pal(5,"Reds")

spplot(ind1, "col_no", col=grey(0.1), col.regions=myPalette,par.settings =
         list(axis.line = list(col =  'transparent')),main="Health Scores")
