import pandas as pd
from mlxtend.preprocessing import TransactionEncoder


path = 'online_retail_II.xlsx'

file = pd.read_excel(path)

invoice = file['Invoice']

invoice = set(invoice)

#tạo danh sách con rỗng với số lượng hóa đơn tương ứng
data = [[] for _ in range(len(invoice))]

for i, inv in enumerate(invoice):
    for j in range(len(file)):
        if file.loc[j, 'Invoice'] == inv:
            data[i].append(file.loc[j, 'StockCode'])


# In kết quả
# for i, inv in enumerate(invoice):
#     print(f'Invoice {inv}: {data[i]}')

# chuuyển các giá trị thành str nhất quán
data_str = [[str(item) for item in row] for row in data]

# In kết quả
for i, inv in enumerate(invoice):
    print(f'Invoice {inv}: {data_str[i]}')

#lưu data
data_stockcode = pd.DataFrame(data_str)

# Lưu DataFrame mới thành một tệp csv
output_path = 'data.csv'
data_stockcode.to_csv(output_path, index=False)
