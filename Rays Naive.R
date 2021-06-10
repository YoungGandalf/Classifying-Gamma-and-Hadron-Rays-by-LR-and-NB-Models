#Adam Hereth A3 CMSC 462

library(mlbench)
library(e1071)
library(tidyverse)
library(aod)
library(ggplot2)
library(InformationValue)
library(ggpubr)
library(Seurat)
library(gmodels)
setwd("C:/Users/Adam/Desktop/Spring 2021/Data Science CMSC 462/A3")
telescope = read.csv("telescope_data.csv")
telescope$class <- factor(telescope$class)
smp_size <- floor(0.75 * nrow(telescope))
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(telescope)), size = smp_size)
train <- telescope[train_ind, ]
test <- telescope[-train_ind, ]

NVmodel <- naiveBayes(class ~ ., data = train)
summary(NVmodel)
pred <- predict(NVmodel, test)
#confusion matrix
conf_matrix <- table(pred, test$class)
conf_matrix
#accuracy
x = (conf_matrix[1]+conf_matrix[4])/(conf_matrix[1]+conf_matrix[2]+conf_matrix[3]+conf_matrix[4])
print(x)


