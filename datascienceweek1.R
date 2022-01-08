a<-c(2,3,0,0,1,0,0,1)
a

a2<-a
a2

a2[2]
a2[-4]
a2[c(1,3,5)]

a2[3]<-2 #3. elemani yapiyor
a2

max(a)

a == 3

which(a==3)

length(a)

c(1:5)

n<- length(a)
ids<-1:n
ids[a==3]

(1:length(a))[a==max(a)]

seq(10,20,2)

a>0

x<-c(45,43,46,48,51,46,50,47)
x
x<-c(x,55,56,60)
x

c(x[1:5],99,x[6:11])

x[12]<-65
x

sample(c(1:10),size = 10,replace = TRUE)
sample(c(1:10),size = 5,replace = FALSE)
sample(c(1:10),size = 5)

?sample

aa<-c(TRUE,FALSE,T,F)
aa
bb<-c("Ceng","cen429")
bb

class(bb)
typeof(bb)
mode(bb)

d<-matrix(c(1:12),nrow = 4,ncol = 3)
d
d<-matrix(c(1:12),nrow = 4,ncol = 3,byrow = TRUE)
d

e<-list(a=c(1:10),b=c("a"),d=c(T,F,T,T))
e
summary(e)

a3<-array(c(1:12),dim = c(6,2))
a3

a4<-array(c(1:24),dim = c(4,3,2))
a4

df<-data.frame(a=c(1:5),b=rnorm(5),d=c("a","b","c","d","e"))
df

names(df)

df<-cbind(df,F=c(6:10))
df

df<-rbind(df,c(6,0,4,"f",11))
df

df$F<-NULL #veri silme satiri
df

data.entry(df) #veri girme

df<-data.frame(df)
df

na.omit(df)

ls()

rm(a)
ls()

rm(list=ls())
ls()
