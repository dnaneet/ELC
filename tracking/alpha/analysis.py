
# coding: utf-8

# In[92]:

import matplotlib.pyplot as plt
import pandas as pd
from pandas.tools.plotting import scatter_matrix
from io import StringIO
import numpy as np
import datetime


# In[77]:

names = ['subject', 'month', 'date', 'day', 'hour']
df.reset_index(level=0, inplace=True)
df=pd.read_csv("data.csv", names=names)


# In[75]:

df.head(4)


# In[78]:

df.iloc[:,0].head(4)
df[['subject']].plot(kind='bar')


# In[108]:

df["hour"].hist(color='k', alpha=0.75)
plt.show()
df["subject"].hist(color='k', alpha=0.95, edgecolor='black', linewidth=1.2)
plt.show()
df["subject"].plot.box()
plt.show()


# In[95]:


# scatter plot matrix
scatter_matrix(df)
plt.show()


# In[ ]:



