#读取数据
iris

# 设置随机种子
set.seed(1234) 

#分类变量因子化


#一、建立决策树模型进行预测
library(grid)
library(mvtnorm)
library(stats4)
library(modeltools)
library(sandwich)
library(strucchange)
library(zoo)

Data <- iris
Data$Species = as.factor(Data$Species)

ind <- sample(2,nrow(Data),replace=TRUE,prob=c(0.7,0.3))
traindata <- Data[ind==1, ]
testdata <- Data[ind==2, ]

#1、C4.5决策树
#构建C4.5决策树
library(party)
ctree.model <- ctree(Species~., data=traindata) 

#输出C4.5决策树图
plot(ctree.model, type="simple") 
plot(ctree.model, type="extended")

#预测C4.5决策树结果
train_predict <- predict(ctree.model) #训练数据集
test_predict <- predict(ctree.model, newdata=testdata) #测试数据集

#输出训练数据集的分类结果和混淆矩阵
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
(train_confusion <- table(actual = traindata$Species, predictedclass = train_predict))

#输出测试数据集的分类结果和混淆矩阵
test_predictdata <- cbind(testdata, predictedclass=test_predict)
test_confusion <- table(actual = testdata$Species, predictedclass = test_predict)

#caret包得到所有参数
library(lattice)
library(ggplot2)
library(caret)
confusionMatrix(test_confusion, positive="1",mode="everything")



  
#Accuracy
#Precision,Recall,F1-Score

#编写自定义函数，用于多分类问题的P、R、F值计算
prf <- function(test_confusion)
{
  Accuracy <- sum(diag(test_confusion))/sum(test_confusion)
  for (i in 1:nrow(test_confusion))
  {
    confusion <- test_confusion
    classname <- colnames(confusion)[i] 
    TP <- confusion[i,i]
    FN <- sum(confusion[i,])-TP
    FP <- sum(confusion[,i])-TP
    TN <- sum(diag(confusion))-confusion[i,i]
    Precision <- TP/(TP+FP)
    Recall <- TP/sum(confusion[i,])
    F1 <- 2*Precision*Recall/(Precision+Recall)
    print(paste(as.character(classname),"'s Precision:", as.character(Precision),sep="",collapse=NULL))
    print(paste(as.character(classname),"'s Recall:", as.character(Recall),sep="",collapse=NULL))
    print(paste(as.character(classname),"'s F1-Score:", as.character(F1),sep="",collapse=NULL))
  }
  print(paste('Accuracy: ',Accuracy))
}
prf(test_confusion)
test_confusion

#2、Cart决策树
library(tree)
#建立CART决策树模型
tree.model <- tree(Species~., data=traindata) 
#决策树图输出
plot(tree.model, type="uniform")
text(tree.model)

#预测结果
train_predict <- predict(tree.model, newdata=traindata, type="class")
test_predict <- predict(tree.model, newdata=testdata, type="class")

#输出训练数据的分类结果与混淆矩阵
train_predictdata <- cbind(traindata, predictedclass=train_predict)
(train_confusion <- table(actual=traindata$Species, predictedclass=train_predict))

#输出训练结果的Accuracy、P、R、F1值
prf(train_confusion)

#输出测试数据的分类结果与混淆矩阵
test_predictdata <- cbind(testdata,predictedclass = test_predict)
(test_confusion <- table(actual=testdata$Species, predictedclass=test_predict))

#输出测试结果的Accuracy、P、R、F1值
prf(test_confusion)

#3、C5.0决策树
library(C50)
#构建决策树模型
c50.model <- C5.0(Species~., data=traindata)
plot(c50.model)

#预测结果
train_predict <- predict(nnet.model, newdata=traindata, type="class")
test_predict <- predict(nnet.model, newdata=testdata, type="class")

#输出训练数据的分类结果与混淆矩阵
train_predictdata <- cbind(traindata, predictedclass=train_predict)
(train_confusion <- table(actual=traindata$Species, predictedclass=train_predict))

#输出训练结果的Accuracy、P、R、F1值
prf(train_confusion)

#输出测试数据的分类结果与混淆矩阵
test_predictdata <- cbind(testdata,predictedclass = test_predict)
(test_confusion <- table(actual=testdata$Species, predictedclass=test_predict))

#输出测试结果的Accuracy、P、R、F1值
prf(test_confusion)

#4、ID3决策树
library(rpart)
library(dplyr)
dim(filter(traindata,Species=="setosa"))[1]
dim(filter(traindata,Species=="versicolor"))[1]
dim(filter(traindata,Species=="virginica"))[1]

dim(filter(testdata,Species=="setosa"))[1]
dim(filter(testdata,Species=="versicolor"))[1]
dim(filter(testdata,Species=="virginica"))[1]

ID3.model<-rpart(Species~.,data = traindata,method = "class") 

train_predict <- predict(ID3.model, data=traindata, type="class")
test_predict <- predict(ID3.model, newdata=testdata, type="class")
testdata

train_predictdata <- cbind(traindata, predictedclass=train_predict)
(train_confusion <- table(actual=traindata$Species, pretictedclass=train_predict))
prf(test_confusion)

test_predictdata <- cbind(testdata, predictedclass=test_predict)
(test_confusion <- table(actual=testdata$Species, pretictedclass=test_predict))
prf(test_confusion)

plot(ID3.model,uniform = T,branch = 0,margin = 0.1,main="iris ID3")
text(ID3.model,use.n = T,col="blue",cex=1.2)

#二、建立BP神经网络模型进行分类预测

#读取数据
Data <- iris
Data$Species = as.factor(Data$Species)

#设置随机种子
set.seed(123)

ind <- sample(2,nrow(Data),replace=TRUE,prob=c(0.7,0.3))
traindata <- Data[ind==1, ]
testdata <- Data[ind==2, ]

#BP神经网络
library(nnet)

#设置参数
size <- 10 #设置节点数
decay <- 0.05 #设置权值衰减系数
nnet.model <- nnet(Species~., traindata, size=size, decay=decay) #建立BP模型
summary(nnet.model)  #输出模型概要

#预测结果
train_predict <- predict(nnet.model, newdata=traindata, type="class")
test_predict <- predict(nnet.model, newdata=testdata, type="class")


#输出训练数据的分类结果与混淆矩阵
train_predictdata <- cbind(traindata, predictedclass=train_predict)

(train_confusion <- table(actual=traindata$Species, predictedclass=train_predict))

#输出训练结果的Accuracy、P、R、F1值
prf(train_confusion)

#输出测试数据的分类结果与混淆矩阵
test_predictdata <- cbind(testdata,predictedclass = test_predict)
(test_confusion <- table(actual=testdata$Species, predictedclass=test_predict))

#输出测试结果的Accuracy、P、R、F1值
prf(test_confusion)

#三、利用贝叶斯神经网络模型分类预测
#读取数据
Data <- iris
Data$Species = as.factor(Data$Species)

#设置随机种子
set.seed(123)

ind <- sample(2,nrow(Data),replace=TRUE,prob=c(0.7,0.3))
traindata <- Data[ind==1, ]
testdata <- Data[ind==2, ]

#利用e1071包的naiveBayes函数建立朴素贝叶斯分类模型
library(e1071)
naiveBayes.model <- naiveBayes(Species~., data=traindata)

# 预测结果
train_predict <- predict(naiveBayes.model, newdata = traindata)  # 训练数据集
test_predict <- predict(naiveBayes.model, newdata = testdata)  # 测试数据集
# 输出训练数据的分类结果、混淆矩阵
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
(train_confusion <- table(actual = traindata$Species, predictedclass = train_predict)) 
##输出训练结果的Accuracy、P、R、F1值
prf(train_confusion)

# 输出测试数据的分类结果、混淆矩阵
test_predictdata <- cbind(testdata, predictedclass = test_predict)
(test_confusion <- table(actual = testdata$Species, predictedclass = test_predict))
# 输出测试数据的Precision、Recall、Accuracy以及F1-SCOREs
prf(test_confusion)

#四、利用KNN模型进行分类与预测
#载入数据
Data <- iris
Data$Species <- as.factor(Data$Species)
set.seed(123)

#随机抽取70%定义为训练数据集，30%为测试数据集
ind <- sample(2,nrow(Data),replace=TRUE,prob=c(0.7,0.3))
traindata <- Data[ind==1, ]
testdata <- Data[ind==2, ]

#使用kknn函数构建knn模型
library(kknn)
kknn.model <- kknn(Species~., train=traindata, test=traindata, k=5)  #训练数据
kknn.model2 <- kknn(Species~., train=traindata, test=testdata, k=5) #测试数据
summary(kknn.model)

#预测结果
train_predict <- predict(kknn.model) #训练
test_predict <- predict(kknn.model2)  #测试

#输出训练集的混淆矩阵，Accuracy、P、R、F1值
(train_confusion <- table(actual = traindata$Species, predictedclass=train_predict))
prf(train_confusion)

#输出测试集的混淆矩阵，Accuracy、P、R、F1值
(test_confusion <- table(actual=testdata$Species,predictedclass=test_predict))
prf(test_confusion)


#五、利用SVM模型进行分类与预测
#载入数据
Data <- iris
Data$Species <- as.factor(Data$Species)
set.seed(123)

#随机抽取70%定义为训练数据集，30%为测试数据集
ind <- sample(2,nrow(Data),replace=TRUE,prob=c(0.7,0.3))
traindata <- Data[ind==1, ]
testdata <- Data[ind==2, ]

# 利用SVM建模
library(e1071)
svm.model <- svm(Species~ ., data = traindata)

#预测结果
train_predict <- predict(svm.model, newdata = traindata,type="class")  # 训练数据集
test_predict <- predict(svm.model, newdata = testdata,type="class")  #测试数据集

#输出训练集的混淆矩阵，Accuracy、P、R、F1值
(train_confusion <- table(actual = traindata$Species, predictedclass=train_predict))
prf(train_confusion)

#输出测试集的混淆矩阵，Accuracy、P、R、F1值
(test_confusion <- table(actual=testdata$Species,predictedclass=test_predict))
prf(test_confusion)

library(gplots)
library(ROCR)



#六、LDA模型分类
#载入数据
Data <- iris
Data$Species <- as.factor(Data$Species)
set.seed(123)

#随机抽取70%定义为训练数据集，30%为测试数据集
ind <- sample(2,nrow(Data),replace=TRUE,prob=c(0.7,0.3))
traindata <- Data[ind==1, ]
testdata <- Data[ind==2, ]


# 建立lda分类模型
library(MASS)
lda.model <- lda(Species ~ ., data = traindata)


#预测结果
train_predict <- predict(lda.model, newdata = traindata, type = "class")  # 训练数据集
train_predict
test_predict <- predict(lda.model, newdata = testdata, type = "class")  # 测试数据集

#输出训练集的混淆矩阵，Accuracy、P、R、F1值
(train_confusion <- table(actual = traindata$Species, predictedclass=train_predict$class))
prf(train_confusion)

#输出测试集的混淆矩阵，Accuracy、P、R、F1值
(test_confusion <- table(actual=testdata$Species,predictedclass=test_predict$class))
prf(test_confusion)

install.packages("adabag")

#七、Bagging模型分类预测
# 建立bagging分类模型
library(adabag)
bagging.model <- bagging(Species ~ ., data = traindata)

# 预测结果
train_predict <- predict(bagging.model, newdata = traindata)  # 训练数据集
test_predict <- predict(bagging.model, newdata = testdata)  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict$class) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$Species, predictedclass = train_predict$class)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict$class)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$Species, predictedclass = test_predict$class))


#八、随机森林模型
# 建立randomForest模型
library(randomForest)
randomForest.model <- randomForest(Species ~ ., data = traindata)

# 预测结果
test_predict <- predict(randomForest.model, newdata = testdata)  # 测试数据集

# 输出训练数据的混淆矩阵
(train_confusion <- randomForest.model$confusion)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$Species, predictedclass = test_predict))




library(gplots)
library(ROCR)


##PS: ROC与PR准确性预测  →  没成功
par(mfrow=c(1,2))

#ROC曲线
traindata$Species

predi <- prediction(train_predict$predictedclass)
#SVM的predict(class)为无效参数？

#样例数据
data(ROCR.simple)
ROCR.simple
pred <- prediction(ROCR.simple$predictions, ROCR.simple$labels) #ROCR.simple$predictions为预测标签，ROCR.simple$labels为真实标签
perf <- performance(pred,"tpr","fpr")
plot(perf,colorize=TRUE)

train_predict_prob <- predict(nnet.model, newdata=traindata, type="raw")
train_predict_class <- predict(nnet.model, newdata=traindata, type="class")

myfunction = function(predict,predictedclass){
  probs <- c()
  for(i in (1:length(predict)))
  {
    prob <- max(predict[i,])
    probs <- c(probs,prob)
  }
  mydata <- data.frame(probs,predictedclass)
  return(mydata)
}
mydata <- myfunction(train_predict_prob,train_predict_class)


#输出并进行模型对比？
data =data.frame(Accuracy=0, Precision = 0,Recall = 0)
data
data = data[-1,]
