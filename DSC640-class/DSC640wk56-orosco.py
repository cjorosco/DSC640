#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import squarify
import os
os.chdir(r'/Users/corosco/DSC640/DSC640-class/week-5-6/data')


# In[4]:


#read file
df = pd.read_csv(r"unemployement-rate-1948-2010.csv")
df.drop(['Series id'], axis=1, inplace=True)


# In[5]:


# group by year
df_group = df.groupby("Year")[["Value"]].mean()
df_group.columns


# In[11]:


# Display the Treemap

squarify.plot(sizes=df_group.values, 
              color=["skyblue", "lightgreen", "yellow"],
              label=df_group.index, alpha=0.7)

# Removing the axis values
plt.axis('off')
plt.title('Python Treemap for Unemployment Rate')
plt.savefig('treemap_p.png')

# Displaying the plot
plt.show()


# In[7]:


df_group.Value


# In[12]:


# Display Area Chart

plt.fill_between(df_group.index, df_group.Value)
plt.title("Python Area Chart: Mean Unemployment Rate Per Year from 1948 - 2010")
plt.xlabel("Year")
plt.ylabel("Unemployment Rate")
plt.savefig('area_p.png')
plt.show()


# In[9]:


# Reshape DF because Pandas plot requires data be in rows and unique columns for layers
pivot_df = df.pivot(index=['Year'], columns=['Period'], )


# In[13]:


# Display Stacked Area Chart
pivot_df.plot.area()
plt.title("Python Stacked Area Chart: Unemployment Rate Per Period from 1948 -2010")
plt.xlabel("Year")
plt.ylabel("Unemployment Rate")
plt.legend(bbox_to_anchor = (1,1))
plt.savefig('stacked_area_p.png')
plt.show()


# In[ ]:




