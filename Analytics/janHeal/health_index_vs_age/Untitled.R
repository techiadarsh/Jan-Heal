#Bar Graph for Disease Vs Number of People Affected
graphtwo<-read.csv("agevscore.csv",TRUE,",")
class(graphtwo)
ggplot(data=graphtwo, aes(x=Age, y=Health_Score)) + geom_bar(stat="identity",width = 0.5,fill = "#00B89B")+ggtitle("Age Vs Health Score")
