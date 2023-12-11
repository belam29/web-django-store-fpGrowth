import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import fpgrowth


# Đọc file văn bản
data = []
with open('data.txt', 'r') as file:
    for line in file:
        stock_code_list = line.strip().split(',')
        data.append(stock_code_list)

# Hiển thị dữ liệu đọc được
# print(data)

def transactionEncoder(data):
    te = TransactionEncoder()
    te_ary = te.fit(data).transform(data)
    df = pd.DataFrame(te_ary, columns=te.columns_)
    return df

def fpGrowth(df):
    fp = fpgrowth(df, min_support=0.01, use_colnames=True)
    return fp

df = transactionEncoder(data)
re = fpGrowth(df)
  
print(re)



    