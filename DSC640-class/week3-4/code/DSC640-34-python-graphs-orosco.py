#!/usr/bin/env python
# coding: utf-8

# In[1]:


# DSC640 Week 3&4 Orosco
# 1 line chart, 1 step chart with Python


# In[2]:


import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
pd.set_option("max_columns", 50)


# In[24]:


# load the datasets into dataframes
df1 = pd.read_excel('world-population.xlsm', header=0)
display(df1.dtypes)


# In[10]:


# Line Chart using matplotlib

fig, ax = plt.subplots(figsize=(10, 5))
ax.ticklabel_format(useOffset=False, style='plain')
plt.plot(df1["Year"], df1["Population"], color='lightskyblue')
plt.ylabel("Population")
plt.xlabel("Year")
plt.title("World Population from 1960 - 2010")
plt.savefig('line1.png')
plt.show()


# In[22]:


fig, ax = plt.subplots(figsize=(10, 5))
ax.ticklabel_format(useOffset=False, style='plain')
plt.step(df1["Year"], df1["Population"], where='pre')
plt.ylabel("Population")
plt.xlabel("Year")
plt.title("World Population from 1960 - 2010")
plt.savefig('line2.png')
plt.show()


# In[ ]:




