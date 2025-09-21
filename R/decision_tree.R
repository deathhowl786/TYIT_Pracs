#install.packages("xlsx")
#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("tree")

library(xlsx)
library(rpart)
library(rpart.plot)
library(caret)
library(tree)

#Loading Data and summarizing
data = read.csv("C:\\TYIT_014\\placement.csv")
summary(data)

#Convert Categorical Variables
data$InternshipExperience = ifelse(data$InternshipExperience == "Yes", 1, 0)
data$ExtraCurricular = ifelse(data$ExtraCurricular == "Yes", 1, 0)
data$CertificationCourse = ifelse(data$CertificationCourse == "Yes", 1, 0)
data$Placement = as.factor(data$Placement)


#Splitting Data into train and test
train_data = data[1:175, ]
test_data = data[176:200, ]
test_labels = test_data$Placement
test_data = test_data[ ,-8]

# making the model #Placement ~ CGPA + AptitudeTestScore #if specific columns
#testtree_model = rpart(Placement ~., data = train_data, method = "class") #with all attributes
testtree_model = rpart(Placement ~ InternshipExperience + ExtraCurricular + ProjectsDone, data = train_data, method = "class") #specific attributes
rpart.plot(testtree_model, type =2, extra = 1, fallen.leaves = TRUE, main = "Decision Tree for Placement Data")
result = predict(testtree_model, test_data, type = "class")
cnf_mat = table(result, test_labels)


#Build model
model_tree = tree(Placement ~ ., data = data)

#Predict
pred_tree = predict(model_tree, test_data, type = "class")

#Evaluate
cnf_mat2 = table(pred_tree, test_labels)

#Plot
plot(model_tree)
text(model_tree, pretty = 0)


