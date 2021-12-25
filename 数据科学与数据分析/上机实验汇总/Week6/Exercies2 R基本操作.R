library(dplyr)
library(nycflights13)

##1.1
Orin.Dest <- dplyr::group_by(flights,origin,dest)
Orin.Dest <- Orin.Dest[,c('origin','dest')]
#数据去重
# 索引去重Orin.Dest[!duplicated(Orin.Dest)]
index <- duplicated(Orin.Dest)
index
Orin.Dest <- as.data.frame(Orin.Dest )
Orin.Dest <- Orin.Dest[!index,]
#unique数据框删除重复项
unique(Orin.Dest)
#distinct（）针对列去重 distinct(df,V1,V2)

##1.2
head(airports)
colnames(airports)
colnames(flights)
head(flights)
airports.selected <- dplyr::select(airports,faa,lat,lon)
flights1 <- merge(flights,airports.selected,by.x=names(flights)[13],by.y=names(airports.selected)[1])
flights1 <- rename(flights1,c(Ori.Lat=lat, Orin.Lon=lon))
flights2 <- merge(flights1,airports.selected,by.x=names(flights)[14],by.y=names(airports.selected)[1])
flights2 <- rename(flights2,c(Dest.Lat=lat, Dest.Lon=lon))
str(flights2)

##1.3
library(geosphere)
Calculate_Distance <- function(Orin.Lon,Orin.Lat,Dest.Lon,Dest.Lat){
  muer.lonlat = rbind(t1=c(Orin.Lon,Orin.Lat),t2=c(Dest.Lon,Dest.Lat))
  muer.dists = distm(muer.lonlat, fun=distVincentyEllipsoid)[1,2]
  return (muer.dists)
}

Calculate_Distance <- function(Orin.Lon,Orin.Lat,Dest.Lon,Dest.Lat){
  # muer.lonlat = rbind(t1=c(Orin.Lon,Orin.Lat),t2=c(Dest.Lon,Dest.Lat))
  muer.dists = distm(matrix(data=c(Orin.Lon,Orin.Lat),nrow = 1,ncol = 2),matrix(data=c(Dest.Lon,Dest.Lat),nrow = 1,ncol = 2), fun=distVincentyEllipsoid)[1,]
  return (muer.dists)
}
Calculate_Distance(117,24,123,35)
names(flights2)

##1.4
#显示循环
names(flights2)

Calculate_Distance(flights2[1,"Orin.Lon"],flights2[1,"Ori.Lat"],flights2[1,"Dest.Lon" ],flights2[1,"Dest.Lat" ])

Calculate_Distance(flights2$Orin.Lon,flights2$Ori.Lat,flights2$Dest.Lon,flights2$Dest.Lat)

flights2$Cal.Distance <- 'Na'
for (i in 1:dim(flights2)[1])
  {
    flights2[i,'Cal.Distance'] <- Calculate_Distance(flights2[i,21],flights2[i,20],flights2[i,23],flights2[i,22])
  }
flights2$Cal.Distance

##1.4
#隐式循环

for (i in dim(flights2)[1])
{
  flights2[i,'tmp'] <- c(flights2[i,21],flights2[i,20],flights2[i,23],flights2[i,22])
}
flights2$tmp
flights$Cal.Distance <- apply(tmp,MARGIN=2,FUN=Calculate_Distance)

##2.1

#去除空值
  #法一
na.omit(tail.num)
  #法二

Count.times <- function(num)
  {
  times <- count(filter(flights2,tailnum==num))
  return(times)
  }
tail.num <- tail.num[complete.cases(tail.num),]
flights.Planes.Info <- select(planes,tailnum)
#分组
tail.num <- group_by(flights2,tailnum)
str(tail.num)

#统计描述
summarise(tail.num,
          count.times = length(tailnum),
          meanDistance = mean(tail.num$distance),
          meanDelay = mean(arr_time-sched_arr_time)
          )

#排序
flights.Planes.Info <-arrange(
  summarise(tail.num,
            count.times = length(tailnum),
            meanDistance = mean(tail.num$distance),
            meanDelay = mean(arr_time-sched_arr_time)
  ),
  desc(meanDelay)
)

##2.2
names(planes)
#按航班号合并数据集
plan.flight <- merge(planes,flights.Planes.Info,by='tailnum')
#排序、去重、访问
flight.sorted <-arrange(plan.flight,desc(count.times))
index <- duplicated(flight.sorted$manufacturer)
flight.sorted <- as.data.frame(flight.sorted)
flight.sorted <- flight.sorted[!index,]
manu <- flight.sorted[1:5,'manufacturer']
manu

##2.3
names(flights)
plan.flight2 <- merge(flights,planes,by='tailnum')
str(plan.flight2)
plan.flight2 <- group_by(plan.flight2,'manufacturer')
flights.Top5 <- plan.flight2[1,]
for(i in manu)
{
  tmp <- filter(plan.flight2,plan.flight2$manufacturer==i)
  print(tmp)
  flights.Top5<-rbind(flights.Top5,tmp)
}

flights.Top5

a = c('1','2')
b = c('3','4')
cbind(a,b)
##diamonds
str(flights)

plan.flight2 <- merge(flights,planes,by='tailnum')
plan.flight2 <- group_by(plan.flight2,'manufacturer')
flights.Top5 <- plan.flight2[1,]
for(i in manu)
{
  tmp <- filter(plan.flight2,plan.flight2$manufacturer==i)
  
  flights.Top5<-rbind(flights.Top5,tmp)
}
flights.Top5