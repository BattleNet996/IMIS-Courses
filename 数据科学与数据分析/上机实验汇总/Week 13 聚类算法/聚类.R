library(cluster)
set.seed(1234)


#1、K-means聚类
iris
Data <- iris[1:4]

#如何确定聚类数目
library(ggplot2)
library(factoextra)
fviz_nbclust(Data,kmeans,method="wss")+geom_vline(xintercept=2,linetype=2)

#模型拟合
km <- kmeans(Data,center = 3,iter.max=10,algorithm="Hartigan-Wong")

print(km)
#查看聚类模型
# print(km)

#混淆矩阵查看聚类结果
(table(actual=iris$Species,predictedclass=km$cluster))

#聚类结果可视化
par(mfrow = c(1, 1))   
plot(x=Data$Sepal.Length,y=Data$Sepal.Width, col=km$cluster,pch="*")

#聚类后各数据占比
km$size / sum(km$size)
#将数据按聚类结果分组
Data.cluster <- data.frame(Data, km$cluster)
Data1 <- Data[which(Data.cluster$km.cluster == 1), ]
Data2 <- Data[which(Data.cluster$km.cluster == 2), ]
Data3 <- Data[which(Data.cluster$km.cluster == 3), ]
#绘制概率密度函数图
par(mfrow = c(1, 4))    
plot(density(Data1[, 1]), col = "red", main = "Sepal.Length")
plot(density(Data1[, 2]), col = "red", main = "Sepal.Width")
plot(density(Data1[, 3]), col = "red", main = "Petal.Width")
plot(density(Data1[, 4]), col = "red", main = "Petal.Width")

#2、K-Mediods聚类
library(fpc)
#判断应分类类别
pamk.best <- pamk(Data)
pamk.best$nc
Data <- iris[1:4]

#模型构建
pam <- pam(Data,3)

(table(actual=iris$Species,predictedclass=pam$cluster))

layout(matrix(c(1,2),1,2)) #页面布局调整

#混淆矩阵查看聚类结果
(table(actual=iris$Species,predictedclass=pam$cluster))

plot(pam)



#3、层级聚类（AGNES）
#因为样本数量过多，最终图形显示可能不太友好，于是抽样示例

dim(iris)#返回行列数

idx<-sample(1:dim(iris)[1],40)#sample的前一个参数代表从哪里取，第二个参数代表取多少个

Data<-iris[idx,-5]


hc<-hclust(dist(Data),method = "ave")  #注意hcluster里边传入的是dist返回值对象

layout(matrix(c(1,1)))
plot(hc)
plot(hc,hang=-1,labels=iris$Species[idx])  #这里的hang=-1使得树的节点在下方对齐
plot(hc,hang=-1)  #这里的hang=-1使得树的节点在下方对齐
#将树分为3块
rect.hclust(hc,k=3)  
groups<-cutree(hc,k=3)   

#4、层次聚类（DIANA）
library(cluster)

#因为样本数量过多，最终图形显示可能不太友好，于是抽样示例

dim(iris)#返回行列数

idx<-sample(1:dim(iris)[1],40)#sample的前一个参数代表从哪里取，第二个参数代表取多少个

Data<-iris[idx,-5]

dv = diana(Data,metric="euclidean")

plot(dv)
#将树分为3块
rect.hclust(dv,k=3)  
groups<-cutree(dv,k=3)  

#5、密度聚类（DBSCAN）
library(dbscan)

Data<-iris[-5]

#EPS：射程范围（与另一观测对象的最大距离）
#borderPoints：边界点
#Minpts:区域内最少的观测数

#确定EPS的kNNdistplot函数，k=dim+1
kNNdistplot(Data,k=5)
abline(h=0.4,col="red",type=2)

ds <- dbscan(Data,eps=0.42,MinPts=5)

table(actual=iris$Species,predictedclass=ds$cluster)

plot(ds,Data)

#打印出iris第一列和第四列为坐标轴的聚类结果
plot(ds,Data[,c(1,4)])

#另一个表示聚类结果的函数，plotcluster
plotcluster(Data,ds$cluster)

#画出聚类结果（黑色是噪声数据）
pairs(Data,col=ds$cluster+1L)


s# 6、EM聚类算法/期望最大化聚类
# 加载mclust包
library(mclust)

set.seed(0)  #设置随机种子号

Data <- iris[-5]

EM <- Mclust(Data)


# 查看模型建模结果
summary(EM, parameter = TRUE)

#绘制聚类结果概率分布图
plot(EM, what = "classification")
table(actual=iris$Species,predictedclass=EM$classification)
par(mfrow=c(1,1))
