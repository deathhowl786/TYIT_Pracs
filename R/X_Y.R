#install.packages("dbscan")
library(dbscan)

data = read.csv('X_Y.csv')
data = data[, -1]

plot(data$x, data$y)
#install.packages("dbscan")
library(dbscan)

model = dbscan(data, eps = 0.785, minPts = 5)
plot(data$x, data$y, col=model$cluster)
