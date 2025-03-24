import numpy as np 
import pandas as pd 
import csv
from scipy import stats
import seaborn as sns
import matplotlib.pyplot as plt

def detect_outliers_zscore(data,columns):
    outliers_dict = {}

    for column in columns: 
        z_scores = np.abs(stats.zscore(data[column]))
        outliers = data[z_scores > 3]
        outliers_dict[column] = outliers
    return outliers_dict
# E-Commerece sales data 2024
eCommeteceSales =pd.read_csv('C:/Users/PC KY PHUONG/OneDrive/Documents/Project SQL/Data_/E-commerece sales data 2024.csv')

eCommeteceSales.info()
eCommeteceSales.isnull().sum()
remove = ['Unnamed: 4']
eCommeteceSales.drop(columns=remove,inplace=True)
eCommeteceSales=eCommeteceSales.dropna()

eCommeteceSales["user id"] = eCommeteceSales["user id"].astype(int)
eCommeteceSales["Time stamp"] = pd.to_datetime(eCommeteceSales["Time stamp"], format="%d/%m/%Y %H:%M", errors="coerce")
eCommeteceSales["Time stamp"] = eCommeteceSales["Time stamp"].astype(str).str.split(" ").str[0]
print(eCommeteceSales)

print("User id check duplicate: ",eCommeteceSales['user id'].duplicated())
print("Product id check duplicate: ",eCommeteceSales['product id'].duplicated())

#Customer details
customerDetails = pd.read_csv('C:/Users/PC KY PHUONG/OneDrive/Documents/Project SQL/Data_/customer_details.csv')

customerDetails.info()
customerDetails.isnull().sum()
customerDetails.dropna()
print("Customer id check duplicate: ",customerDetails['Customer ID'].duplicated())

numeric_columns = customerDetails.select_dtypes(include=['number']).columns
detect_outliers_zscore(customerDetails,numeric_columns)

plt.figure(figsize = (12,6))
sns.boxplot(data=customerDetails[numeric_columns])
plt.xticks(rotation = 45)
plt.title("Boxplot check")
plt.show()

#product_details
productDetails = pd.read_csv('C:/Users/PC KY PHUONG/OneDrive/Documents/Project SQL/Data_/product_details.csv')

productDetails.info()
productDetails.isnull().sum()
remove=['Stock','Product Details','Dimensions','Color','Ingredients','Direction To Use','Size Quantity Variant','Product Description',
'Quantity','List Price','Variants','Brand Name','Asin','Upc Ean Code','Product Dimensions','Image','Product Url','Sku',
'Product Specification','Model Number','About Product','Technical Details','Selling Price']
productDetails.drop(columns=remove,inplace=True)
productDetails.dropna()

#Export file csv 
Ecommerece_sales_data = eCommeteceSales.to_csv('SaleData.csv', index = False, encoding = 'utf-8-sig')
customer_details = customerDetails.to_csv('Customer.csv', index = False, encoding = 'utf-8-sig')
product_details = productDetails.to_csv('Product.csv', index = False, encoding = 'utf-8-sig')