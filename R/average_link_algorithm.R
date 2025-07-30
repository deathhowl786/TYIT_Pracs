#install.packages("sparcl")
library(cluster)
library(sparcl)
data = read.csv('//home//user//Downloads/adj_mat.csv')

adj_mat = as.dist(data)

model = hclust(adj_mat, method="average")
plot(model, main="Average Link Algorithm") #Graph shape not showing properly

DE = as.dendrogram(model)
plot(DE, main="Average Link Algorithm") #Graph shape showing properly

#Imp. Methods
model$merge # -ve is the element and -ve is a cluster, each row represents a clustering action
model$height #gives height of each cluster
model$order #gives order of elements

# n to 1 clusters using cutree
two = cutree(model, 2) # 2 clusters
three = cutree(model, 3) # 3 clusters


# install sparcl package
ColorDendrogram(model, three, branchlength = length(model$height))


