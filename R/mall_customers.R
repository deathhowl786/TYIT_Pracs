
data = read.csv('Mall_Customers.csv')
data1 = data[ , c(4, 5)]

normalize = function(arr){
  l = min(arr)
  g = max(arr)
  return ((arr-l)/(g-l))
}

normal_data = as.data.frame(lapply(data1, normalize))
dist_mat = dist(normal_data, method='euclidean')

model_single = hclust(dist_mat, method = 'single')
model_complete = hclust(dist_mat, method = 'complete')

clusters_single = cutree(model_single, 5)
clusters_complete = cutree(model_complete, 5)


ColorDendrogram(model_single, clusters_single, branchlength = length(model_single$height))
ColorDendrogram(model_complete, clusters_complete, branchlength = length(model_complete$height))

#assigning the clusters                                                                                                            
data$Cluster = clusters_complete
#customers with highest annual score and spending score
data[data$Cluster==4,]