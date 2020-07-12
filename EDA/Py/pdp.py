import pandas as pd
import pandas_profiling as pdp
import os 
base_path='/Users/KokiAndo/Desktop/R/hatenablog/EDA'
data = pd.read_csv(os.path.join(base_path, 'data/train.csv'))

prof = pdp.ProfileReport(data)
prof.to_file(os.path.join(base_path, 'eda_report/pdp_report.html'))