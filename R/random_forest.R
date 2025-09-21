#1. boot strap sampling - makes n subsets of the training data
#using each subset it creates a decision tree
#oob - out of bag 

#install.packages("randomForest")

# <=== Simple ===> 
library(randomForest)
set.seed(123)


#sample_index = sample(1:nrow(iris), 0.9 * nrow(iris))
#train_data = iris[sample_index, ]
#test_data = iris[-sample_index, ]
#model = randomForest( Species ~ ., data = train_data, ntree = 100)
#predictions = predict(model, test_data)
#conf_mat = table(predictions, test_data$Species)
#print(model)

#data = data.frame(read.csv("//home//user//Desktop//TYIT_014//codes//R//placement.csv"))
#data$InternshipExperience = ifelse(data$InternshipExperience == "Yes", 1, 0)
#data$ExtraCurricular = ifelse(data$ExtraCurricular == "Yes", 1, 0)
#data$CertificationCourse = ifelse(data$CertificationCourse == "Yes", 1, 0)
#data$Placement = as.factor(data$Placement)
#sample_index = sample(1:nrow(data), 0.9 * nrow(data))
#train_data = data[sample_index, ]
#test_data = data[-sample_index, ]
#model = randomForest(train_data$Placement ~., data = train_data, ntree = 100)
#predictions = predict(model, test_data)
#conf_mat = table(predictions, test_data$Placement)
#
#model$oob.times
#model$forest
#model$ntree
#model$predicted
#model$proximity



sample_index = sample(1:nrow(iris), 0.9 * nrow(iris))
train_data = iris[sample_index, ]
test_data = iris[-sample_index, ]
model = randomForest(
  Species ~., 
  data = train_data,
  ntree = 500, 
  mtry = 2,
  importance = TRUE,
  proximity = TRUE,
  sampsize = c(30, 30, 30),
  replace = TRUE,
  nodesize = 5,
  maxnodes = 30, 
  keep.forest = TRUE, 
  do.trace = 100
)