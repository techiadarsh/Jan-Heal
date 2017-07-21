#Bar Graph for Disease Vs Number of People Affected
library(ggplot2)
graphone<-read.csv("habits_Haryana.csv",TRUE,",")
class(graphone)
ggplot(data=graphone, aes(x=Habits, y=No.of.People.Affected)) + geom_bar(stat="identity",width = 0.5,fill = "#42A5F5")+ggtitle("Haryana") +
  theme(plot.title = element_text(hjust = 0.5))
