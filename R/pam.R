library(cluster)
data = iris
X = data[, -5]
model = pam(X, k=3)
model$clusinfo # info on all clusters
model$clustering #Gives cluster of each point
model$medoids # Gives medoids of all clusters with the features

X$Cluster = model$clustering # Adding a cluster column to dataset with their clusters
X[X$Cluster==3, ] # filter cluster 3
clusplot(model) # plotting graph for model
plot(data$Sepal.Length, data$Sepal.Width, col=model$clustering)