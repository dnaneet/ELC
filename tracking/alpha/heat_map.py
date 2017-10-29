
# coding: utf-8

# In[1]:

#Importing required packages.  For example: MATLAB imports nearly ALL PACKAGES!
import matplotlib.pyplot as plt
import pandas as pd
from io import StringIO
import numpy as np


# In[10]:

#Importing data file visits_by_day_hour_2.csv and plotting it as a heat map.
# At the moment, some sort of linear interpolation is being used to interpolate data.
plt.close()
df_hrday=pd.read_csv('visits_by_day_hour_2.csv', skiprows=[0,1,2])
#print df_hrday
df_hrday=df_hrday.pivot('DayName', 'Group1', 'SignInCount')
X=df_hrday.columns.values
Y=df_hrday.index.values
Z=df_hrday.values
x,y=np.meshgrid(X, Y, sparse=True)
#levels = np.linspace(0, 150, 10)
#cp=plt.contourf(X, Y, Z, 25, levels=levels, cmap="jet", interpolation="none")
cp=plt.contourf(X, Y, Z, 300, cmap="jet", interpolation='nearest')
#plt.clabel(cp, colors = 'k', fmt = '%2.1f', fontsize=12)
plt.colorbar(cp)
plt.xlabel('Time [24 hour format]', size=14)
plt.ylabel('Day of week [1=Monday, 2=Tuesday...]', size=14)
plt.xlim(1000,1800)
#plt.show()
plt.savefig('usage_heat_map_0817.pdf', dpi=450, orientation='landscape', bbox_inches='tight')
plt.close()


# In[ ]:



