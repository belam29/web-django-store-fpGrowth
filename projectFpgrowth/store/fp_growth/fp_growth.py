import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import fpgrowth
import os


                
def transaction(data):
    te = TransactionEncoder()
    te_ary = te.fit(data).transform(data)
    df = pd.DataFrame(te_ary, columns=te.columns_)
    return df
    
def fp_growth(data):
    df = transaction(data)
    result = fpgrowth(df, min_support=0.02, use_colnames=True)
    return result

def predict_fpGrowth(user_input, data, top_n=4):
    # Convert user fp_growth(data)input to a set
    
    result = fp_growth(data)
    user_input_set = set(user_input)

    # Filter DataFrame based on the condition that the user input is a subset
    predictions = result[result['itemsets'].apply(lambda x: user_input_set.issubset(x))]

    # Sort predictions based on 'support' in descending order
    predictions = predictions.sort_values(by='support', ascending=False)

    # Select the top N predictions
    top_n_predictions = predictions.head(top_n)

    # Extract only the items from the top N predictions
    top_n_items = [item for itemset in top_n_predictions['itemsets'] for item in itemset]

    return top_n_items

def result_fpGrowth(user_input):
    # Lấy đường dẫn của thư mục hiện tại
    current_dir = os.path.dirname(os.path.abspath(__file__))

    # Kết hợp đường dẫn của thư mục hiện tại với tên file
    data_file_path = os.path.join(current_dir, 'data.txt')

    # Đọc file văn bản
    data = []
    with open(data_file_path, 'r') as file:
            for line in file:
                list = line.strip().split(',')
                data.append(list)
                
    
    # Get top 4 predictions based on user input
    top_predictions = set(predict_fpGrowth(user_input, data))
    print(top_predictions)
    return top_predictions
        
    






    