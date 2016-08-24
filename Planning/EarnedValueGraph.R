library(ggplot2)

# Some random data
week   <-c(1:22)
planned<-c(0,5,10,20,22,25,27,30,40,45,50,60,62,65,67,70,80,90,92,95,97,100)
  cost<- c(0,5,20,25,27,30,32,35,37,40,50,52,55,57,60,65,70,75,80,80,80,80)
  value<-c(0,5,10,20,22,25,30,40,45,50,52,55,57,60,65,70,80,82,85,85,85,85)

# EVGRaph
df<-data.frame(week,planned,cost,value)

p<-ggplot(df, aes(x=week,y="Progress",color=vairable))
p<-p+geom_line(aes(y=planned,col="Planned"))
pdf(file="FEV_Planned.pdf", width=10, height=6)
p
dev.off()
p<-p+geom_line(aes(y=cost,col="Cost"))
pdf(file="FEV_Cost.pdf", width=10, height=6)
p
dev.off()
p<-p+geom_line(aes(y=value,col="Earned Value"))
pdf(file="FEV_Earned.pdf", width=10, height=6)
p
dev.off()
p


# Burndown, with replanning
bdplanned = 100-planned
replan=bdplanned
replan[5:22]=replan[5:22]+10
replan[15:22]=replan[15:22]+30


bd<-data.frame(week,bdplanned,replan)
p<-ggplot(df, aes(x=week,y="#Story Points still to Complete",color=vairable))
p<-p+geom_line(aes(y=bdplanned,col="Initial Plan"))
p<-p+geom_line(aes(y=replan,col="Replan"))
png(file="FBurndown_Replan.png", width = 600, height=360)
p
dev.off()
