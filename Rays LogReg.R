#Adam Hereth A3 CMSC 462

library(tidyverse)
library(aod)
library(ggplot2)
library(InformationValue)
library(ggpubr)
library(Seurat)
library(caret)
setwd("C:/Users/Adam/Desktop/Spring 2021/Data Science CMSC 462/A3")
telescope1 = read.csv("telescope_data.csv")
telescope1$class <- factor(telescope1$class)
smp_size <- floor(0.75 * nrow(telescope1))
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(telescope1)), size = smp_size)
train <- telescope[train_ind, ]
test <- telescope[-train_ind, ]

glm.fit <- glm(class ~ .,data=train,family=binomial)

summary(glm.fit) # display results

probabilities <- glm.fit %>% predict(test, type = "link")
head(probabilities)
contrasts(test$class)
predicted.classes <- ifelse(probabilities > 0.5, "h", "g")
head(predicted.classes)
# Model accuracy
mean(predicted.classes == test$class)

# or I can use a table again
t = table(predicted = predicted.classes, actual = test$class)
train_con_mat = confusionMatrix(t, positive = "h")
c(train_con_mat$overall["Accuracy"])


