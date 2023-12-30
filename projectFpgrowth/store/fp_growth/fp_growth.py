import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import fpgrowth

import os



def transactionEncoder(data):
    te = TransactionEncoder()
    te_ary = te.fit(data).transform(data)
    df = pd.DataFrame(te_ary, columns=te.columns_)
    return df

def fpGrowth(df):
    fp = fpgrowth(df, min_support=0.01, use_colnames=True)
    return fp

def result_fpGrowth():
    # Lấy đường dẫn của thư mục hiện tại
    current_dir = os.path.dirname(os.path.abspath(__file__))

    # Kết hợp đường dẫn của thư mục hiện tại với tên file 'data.txt'
    data_file_path = os.path.join(current_dir, 'data.txt')

    # Đọc file văn bản
    data = []
    with open(data_file_path, 'r') as file:
        for line in file:
            stock_code_list = line.strip().split(',')
            data.append(stock_code_list)

    # Hiển thị dữ liệu đọc được
    # print(data)   
    df = transactionEncoder(data)
    re = fpGrowth(df)
    
    return re




    