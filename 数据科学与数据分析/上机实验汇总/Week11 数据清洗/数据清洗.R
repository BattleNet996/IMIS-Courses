library(dplyr)
library(xlsx)
library(readxl)  #不需要java环境 read_xlsx
apply.data = read_xlsx("E:\\Desktop\\Week 11_数据整理作业数据 (1)\\专利清洗作业.xlsx",2)
authorize.data = read_xlsx("E:\\Desktop\\Week 11_数据整理作业数据 (1)\\专利清洗作业.xlsx",4)

#1 数据清洗
#1.1 缺失值处理
which(is.na(apply.data),arr.ind=T)  #which函数查看df总体是否有缺失值，arr.ind返回坐标
sum(is.na(apply.data))  #求缺失值元素个数总和
sum(complete.cases(apply.data)) #求非空行数总和
table(is.na(apply.data$申请号)) #根据某列统计缺失的行数
table(complete.cases(apply.data$专利类型))  #True代表非缺失
mean(is.na(apply.data$申请号))  #查看缺失值占比

#循环遍历，查询每列缺失值占比
for (i in colnames(apply.data)){
  print(table(is.na(apply.data[,i])))
  print(mean(is.na(apply.data[,i])))
}
apply.data <- select(apply.data,申请号:申请日)

authorize.data[!complete.cases(authorize.data),]  #列出有缺失值的行
nrow(authorize.data[!complete.cases(authorize.data),])  #计算有缺失值的样本量
#1.2 数据表合并
# merge(x, y, by = intersect(names(x), names(y)),
#       by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all,
#       sort = TRUE, suffixes = c(".x",".y"),
#       incomparables = NULL, ...)
data = merge(apply.data,authorize.data,by = "申请号")
str(data)
#1.2 数据去重
index <- duplicated(data$申请号)
data[!index,]
write.csv(data,"E:\\Desktop\\data.csv")


#2 数据分析
#2.1 group_by和summarise分组统计
library(ggplot2)
data <- rename(data,city=区属.x)

data <- group_by(data,factor(city))


summarise(data,
       count.area = length(申请号)
     )

ggplot(data,aes(x=count.area),fill=facter(city))+
  geom_bar()

