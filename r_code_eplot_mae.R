deep2<-read.csv("D://beena_data//DEEP_data.csv", header=T)
hand2<-read.csv("D://beena_data//HAND_data.csv", header=T)

Missing_data <- dplyr::anti_join(deep2, hand2, by="utts_vow")  #ideally=0, else need to check

Missing_data

#there was a space after the data in DEEP.csv, that caused an issue

deep<-read.csv("D://beena_data//DEEP.csv", header=T)
hand<-read.csv("D://beena_data//HAND.csv", header=T)


library(dplyr)
missing_data <- dplyr::anti_join(deep, hand, by="utts_vow")  #ideally=0, else need to check

deep_new <- dplyr::anti_join(deep, missing_data, by="utts_vow")  #ideally=0, else need to check

hand_new <- dplyr::anti_join(hand, missing_data, by="utts_vow")  #ideally=0, else need to check

write.csv(deep_new,"D://beena_data//DEEP_corrected.csv")
write.csv(hand_new,"D://beena_data//HAND_corrected.csv")
missing_data1 <- dplyr::anti_join(deep_new, hand_new, by="utts_vow")  #ideally=0, else need to check


####MAE


deep2<-read.csv("D://beena_data//DEEP_Corrected_new.csv", header=T)
hand2<-read.csv("D://beena_data//HAND_Corrected_new.csv", header=T)

join<-cbind(deep2,hand2)

toogood<-join[ which(join$Speaker=='toogood'), ]
hillary<-join[ which(join$Speaker=='hillary'), ]
crump<-join[ which(join$Speaker=='crump'), ]
nordmeyer<-join[ which(join$Speaker=='nordmeyer'), ]

count_tg<-aggregate(list(toogood),by=list(toogood$Vowel),FUN=length)
count_hi<-aggregate(list(hillary),by=list(hillary$Vowel),FUN=length)
count_cr<-aggregate(list(crump),by=list(crump$Vowel),FUN=length)
count_nd<-aggregate(list(nordmeyer),by=list(nordmeyer$Vowel),FUN=length)

count<-cbind(count_tg$Group.1,count_hi$F1_d, count_nd$F1_d, count_tg$F1_d,count_cr$F1_d)
count<-as.data.frame(count)
names(count) <- c("Vowel", "A","B","C","D")

join_mae_f1<-abs(join$F1_d - join$F1)
join_mae_f1mean<-mean(join_mae_f1,na.rm=TRUE)
join_mae_f2<-abs(join$F2_d - join$F2)
join_mae_f2mean<-mean(join_mae_f2,na.rm=TRUE)

toogood_mae_f1<-abs(toogood$F1_d - toogood$F1)
tg_mae_f1mean<-mean(toogood_mae_f1)
toogood_mae_f2<-abs(toogood$F2_d - toogood$F2)
tg_mae_f2mean<-mean(toogood_mae_f2)

hillary_mae_f1<-abs(hillary$F1_d - hillary$F1)
hi_mae_f1mean<-mean(hillary_mae_f1,na.rm=TRUE)
hillary_mae_f2<-abs(hillary$F2_d - hillary$F2)
hi_mae_f2mean<-mean(hillary_mae_f2,na.rm=TRUE)

crump_mae_f1<-abs(crump$F1_d - crump$F1)
cr_mae_f1mean<-mean(crump_mae_f1,na.rm=TRUE)
crump_mae_f2<-abs(crump$F2_d - crump$F2)
cr_mae_f2mean<-mean(crump_mae_f2,na.rm=TRUE)

nd_mae_f1<-abs(nordmeyer$F1_d - nordmeyer$F1)
nd_mae_f1mean<-mean(nd_mae_f1,na.rm=TRUE)
nd_mae_f2<-abs(nordmeyer$F2_d - nordmeyer$F2)
nd_mae_f2mean<-mean(nd_mae_f2,na.rm=TRUE)

#Vowel based MAE

library(sqldf)
a <- subset(toogood, grepl("a:",Vowel, ignore.case = TRUE))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("i:",Vowel, ignore.case = TRUE))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("o:",Vowel, ignore.case = TRUE))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("u:",Vowel, ignore.case = TRUE))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("@:",Vowel, ignore.case = TRUE))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("E",Vowel))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("I",Vowel))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("O",Vowel))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("U",Vowel))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("V",Vowel))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean

a <- subset(toogood, grepl("A",Vowel))
a_mae_f1<-abs(a$F1_d - a$F1)
a_mae_f1mean<-mean(a_mae_f1,na.rm=TRUE)
a_mae_f2<-abs(a$F2_d - a$F2)
a_mae_f2mean<-mean(a_mae_f2,na.rm=TRUE)
a_mae_f1mean
a_mae_f2mean




##eplot

library(emuR)

#hand
data <- cbind(toogood$F1,toogood$F2)
phonetic <- toogood$Vowel
#eplot(data,phonetic,formant=TRUE,centroid=TRUE,dopoints =FALSE,col="red",xlim = c(200,2500),ylim = c(100,1000))

#deep_formants<-deep_formants[!(deep_formants$Vowels=="U"),]
#deep_formants<-deep_formants[!(deep_formants$Vowels=="n"),]
#deep_formants<-subset(deep_formants, deep_formants$Vowels!="n")

#deep
data1 <- cbind(toogood$F1_d,toogood$F2_d)
phonetic1 = toogood$Vowel_d
#eplot(data1,phonetic1,formant=TRUE,centroid=TRUE,dopoints=FALSE,col=FALSE,xlim = c(200,2500),ylim = c(100,1000))


j=1

{
  eplot(data,phonetic,formant=T,centroid=T,doellipse=T,main="Speaker C : HAND Vs DEEP results",col="red",xlim = c(600,2500),ylim = c(100,1000), xlab="F2 (in Hz)",ylab="F1 (in Hz)",type="l", lty=2)
  j=j+1
  par(new=T)
}
{
  eplot(data1,phonetic1,formant=T,centroid=T,doellipse=T,main="",col="black",xlim = c(600,2500),ylim = c(100,1000),xlab="F2 (in Hz)",ylab="F1 (in Hz)")
}
plot_colors <- c("red","black")
legend(x = "bottom",inset = 0,
       legend = c("Hand-labelled", "Deep Formants"), 
       col=plot_colors, lwd=5, cex=.5, horiz = TRUE)


#crump
toogood<-as.data.frame(crump)

#hand
data <- cbind(toogood$F1,toogood$F2)
phonetic <- toogood$Vowel
#eplot(data,phonetic,formant=TRUE,centroid=TRUE,dopoints =FALSE,col="red",xlim = c(200,2500),ylim = c(100,1000))

#deep_formants<-deep_formants[!(deep_formants$Vowels=="U"),]
#deep_formants<-deep_formants[!(deep_formants$Vowels=="n"),]
#deep_formants<-subset(deep_formants, deep_formants$Vowels!="n")

#deep
data1 <- cbind(toogood$F1_d,toogood$F2_d)
phonetic1 = toogood$Vowel_d
#eplot(data1,phonetic1,formant=TRUE,centroid=TRUE,dopoints=FALSE,col=FALSE,xlim = c(200,2500),ylim = c(100,1000))


j=1

{
  eplot(data,phonetic,formant=T,centroid=T,doellipse=T,main="Speaker D : HAND Vs DEEP results",col="red", xlab="F2 (in Hz)",ylab="F1 (in Hz)",type="l", lty=2,xlim = c(200,2250),ylim = c(200,750))
  j=j+1
  par(new=T)
}
{
  eplot(data1,phonetic1,formant=T,centroid=T,doellipse=T,main="",col="black",xlab="F2 (in Hz)",ylab="F1 (in Hz)",xlim = c(200,2250),ylim = c(200,750))
}
plot_colors <- c("red","black")
legend(x = "bottom",inset = 0,
       legend = c("Hand-labelled", "Deep Formants"), 
       col=plot_colors, lwd=5, cex=.5, horiz = TRUE)


#nordmeyer
toogood<-as.data.frame(nordmeyer)

#hand
data <- cbind(toogood$F1,toogood$F2)
phonetic <- toogood$Vowel
#eplot(data,phonetic,formant=TRUE,centroid=TRUE,dopoints =FALSE,col="red",xlim = c(200,2500),ylim = c(100,1000))

#deep_formants<-deep_formants[!(deep_formants$Vowels=="U"),]
#deep_formants<-deep_formants[!(deep_formants$Vowels=="n"),]
#deep_formants<-subset(deep_formants, deep_formants$Vowels!="n")

#deep
data1 <- cbind(toogood$F1_d,toogood$F2_d)
phonetic1 = toogood$Vowel_d
#eplot(data1,phonetic1,formant=TRUE,centroid=TRUE,dopoints=FALSE,col=FALSE,xlim = c(200,2500),ylim = c(100,1000))


j=1

{
  eplot(data,phonetic,formant=T,centroid=T,doellipse=T,main="Speaker B : HAND Vs DEEP results",col="red", xlab="F2 (in Hz)",ylab="F1 (in Hz)",type="l", lty=2,xlim = c(500,3000),ylim = c(150,1200))
  j=j+1
  par(new=T)
}
{
  eplot(data1,phonetic1,formant=T,centroid=T,doellipse=T,main="",col="black",xlab="F2 (in Hz)",ylab="F1 (in Hz)",xlim = c(500,3000),ylim = c(150,1200))
}
plot_colors <- c("red","black")
legend(x = "bottom",inset = 0,
       legend = c("Hand-labelled", "Deep Formants"), 
       col=plot_colors, lwd=5, cex=.5, horiz = TRUE)


#hillary
toogood<-as.data.frame(hillary,na.rm=TRUE)

write.csv(hillary,"D:\\beena_data\\hil.csv")
hil<-read.csv("D:\\beena_data\\hil.csv", header=TRUE)

toogood<-hil
#HAND
data <- cbind(toogood$F1,toogood$F2)
phonetic <- toogood$Vowel
#eplot(data,phonetic,formant=TRUE,centroid=TRUE,dopoints =FALSE,col="red",xlim = c(200,2500),ylim = c(100,1000))

#deep_formants<-deep_formants[!(deep_formants$Vowels=="U"),]
#deep_formants<-deep_formants[!(deep_formants$Vowels=="n"),]
#deep_formants<-subset(deep_formants, deep_formants$Vowels!="n")

#DEEP
data1 <- cbind(toogood$F1_d,toogood$F2_d)
phonetic1 = toogood$Vowel_d
#eplot(data1,phonetic1,formant=TRUE,centroid=TRUE,dopoints=FALSE,col=FALSE,xlim = c(200,2500),ylim = c(100,1000))


j=1

{
  eplot(data,phonetic,formant=T,centroid=T,doellipse=T,main="Speaker A : HAND Vs DEEP results",col="red", xlab="F2 (in Hz)",ylab="F1 (in Hz)",type="l", lty=2,xlim = c(300,2500),ylim = c(100,1100))
  j=j+1
  par(new=T)
}
{
  eplot(data1,phonetic1,formant=T,centroid=T,doellipse=T,main="",col="black",xlab="F2 (in Hz)",ylab="F1 (in Hz)",xlim = c(300,2500),ylim = c(100,1100))
}
plot_colors <- c("red","black")
legend(x = "bottom",inset = 0,
       legend = c("Hand-labelled", "Deep Formants"), 
       col=plot_colors, lwd=5, cex=.5, horiz = TRUE)


