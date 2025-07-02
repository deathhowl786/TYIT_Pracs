library(class)
library(caret)
library(dplyr)


set.seed(7916869)
normalize = function(arr){
  return ((arr - min(arr))/(max(arr) - min(arr)))
}

#shuffling the data and seperating labels and values
shuffled_iris = iris[sample(nrow(iris)), ]

#normalizing data
iris_norm = as.data.frame(lapply(shuffled_iris[ ,1:4], normalize))
iris_label = as.data.frame(shuffled_iris[5])
#iris_norm = as.data.frame(shuffled_iris[ ,1:4])
#iris_label = as.data.frame(shuffled_iris[ ,5])

#training data
train_index = 1:140
train_data = iris_norm[train_index, ]
train_label = iris_label[train_index, ]

#test data
test_index = 141:150
test_data = iris_norm[test_index, ]
test_label = iris_label[test_index, ]

K = floor(sqrt(nrow(train_data)))

model_prediction = knn(train_data, test_data, k = K, cl = train_label) #class library
cnf_mat = confusionMatrix(model_prediction, test_label) #caret library