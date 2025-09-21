library(arules)

# Read Data
data = read.csv("transactions.csv")

# Cleaning Transaction ID Column
dataTID = as.factor(data$TID)

# Cleaning Item Column
data$ITEMS = as.character(data$ITEMS)

# Splitting the data and storing into transactions
transactions = split(data$ITEMS, data$TID)

# Making trans model
trans = as(transactions, 'transactions')
inspect(trans)
itemFrequencyPlot(trans)

# Get all the rules with support 30% and confidence 75%
rules = apriori(trans, parameter = list(support=0.3, confidence=0.75))
inspect(rules)

#Top 5 rules by confidence
inspect(sort(rules, by = "confidence")[1:5])

