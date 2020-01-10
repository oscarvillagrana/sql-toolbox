import numpy as np

# import text and parse
my_data = np.loadtxt('mycsv.csv', dtype=float, delimiter='.', comments='#')

# import text and parse
my_csv_data = np.genfromtxt('mycsv.csv', dtype=None, delimiter='.', skip_header=1)


import pandas as pd

# import csv
df = pd.read_csv('mycsv.csv', sep=',')


# import file using pandas
# creates type pandas.io.excel.ExcelFile
file = pd.ExcelFile('sf-specials.xlsx')


# sheet property available for each page
file.sheet_names

# suply hard coded value
df1 = file.parse('sheet1')
df2 = file.parse('sheet2')

# or supply index
df3 = file.parse(0)
df4 = file.parse(1)

