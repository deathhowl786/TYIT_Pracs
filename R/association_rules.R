library(arules)

# All Transactions
transaction_data = list(c('A', 'B'),
                        c('A', 'B', 'P', 'C'),
                        c('A', 'P', 'C', 'D'),
                        c('P', 'Q', 'R'),
                        c('L', 'M', 'N'),
                        c('A', 'B', 'C', 'D'),
                        c('B', 'C', 'D'),
                        c('L', 'M', 'N', 'A', 'B', 'C', 'D'))

#  Convert into Transaction Type
trans = as(transaction_data, 'transactions')
inspect(trans)
itemFrequencyPlot(trans)

# Get all the rules with support 30% and confidence 75%
rules = apriori(trans, parameter = list(support=0.3, confidence=0.75))
inspect(rules)

#Top 5 rules by confidence
inspect(sort(rules, by = "confidence")[1:5])