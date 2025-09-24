data = USArrests

normalize = function(a){
  return ((a - min(a))/(max(a)-min(a)))
}


data$Murder = normalize(data$Murder)
data$Assault = normalize(data$Assault)
data$UrbanPop = normalize(data$UrbanPop)
data$Rape = normalize(data$Rape)

model = kmeans(data, centers=4)

one = model$cluster[model$cluster==1]
two = model$cluster[model$cluster==2]
three = model$cluster[model$cluster==3]
four = model$cluster[model$cluster==4]
print("1. Cities with Low Crime Rate but relatively high Urban poputaion")
one

print("2. Cities with extremely Low Crime Rate but decent Urban poputaion")
two


print("3. Cities with medium crime rate and urban population")
three

print("4. Cities with High Crime Rate  and Urban poputaion")
four


model$cluster
model$centers
model$totss
model$tot.withinss
model$withinss
model$size
model$iter



