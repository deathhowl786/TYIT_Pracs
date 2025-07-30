library(cluster)
library(sparcl)
data = iris
data = data[, -5]

adj_mat = dist(data, method="euclidean")

model = hclust(adj_mat, method="average")
#plot(model, main="Average Link Algorithm") #Graph shape not showing properly)


three = cutree(model, 3)
plot(three)
ColorDendrogram(model, three, branchlength = 150)

