#install.packages("dbscan")
library(dbscan)

data = iris
X = data[, -5]

model = dbscan(X, eps = 1, minPts = 5)
