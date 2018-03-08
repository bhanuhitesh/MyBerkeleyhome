
##Heroes Of Pymoli Data Analysis


### Observations :

1. From the Age groups analysis, it can be concluded that Age groups between 21 to 24 yrs of age has MAXIMUM purchase Value of $696.09

2. From Item analysis, it can be concluded that Item "Arcane Gem" & "Betrayal, Whisper of Grieving Widow" are the most popular games out of all games and they were purchased for 11 times

3. Retribution Axe is the most profitable out of games with a total value of $37.26


```python
import pandas as pd
import numpy as np

df_players = pd.read_json("purchase_data.json")
```

**Players Count**



```python
players_count = pd.DataFrame(df_players["SN"]).nunique().reset_index(name = "Total Players")
players_count
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>Total Players</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>SN</td>
      <td>573</td>
    </tr>
  </tbody>
</table>
</div>



**Purchasing Analysis (Total)**


```python
players_items = pd.DataFrame(df_players["Item ID"]).nunique().reset_index(name = "Number of unique items ")
players_items
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>Number of unique items</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Item ID</td>
      <td>183</td>
    </tr>
  </tbody>
</table>
</div>




```python
average_price = pd.DataFrame(df_players["Price"]).mean().reset_index(name = "Average Purchase Price ")
average_price
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>Average Purchase Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Price</td>
      <td>2.931192</td>
    </tr>
  </tbody>
</table>
</div>




```python
total_purchases = pd.DataFrame(df_players["Price"]).count().reset_index(name = "Total Number of Purchases")
total_purchases
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>Total Number of Purchases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Price</td>
      <td>780</td>
    </tr>
  </tbody>
</table>
</div>




```python
total_revenue = pd.DataFrame(df_players["Price"]).sum().reset_index(name = "Total Revenue")
total_revenue
round(total_revenue,2)
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>index</th>
      <th>Total Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Price</td>
      <td>2286.33</td>
    </tr>
  </tbody>
</table>
</div>



## Gender Demographics

#### Percentage and Count of Male Players


```python
total_male_counts = df_players[df_players["Gender"] == "Male"]["SN"].nunique()

perc_of_male = total_male_counts/df_players["SN"].nunique()*100

print(total_male_counts)
print('{:.2f}%'.format(perc_of_male))
print(str(round(perc_of_male,2))+"%")
```

    465
    81.15%
    81.15%
    

#### Percentage and Count of Female Players


```python
total_female_counts = df_players[df_players["Gender"]== "Female"]["SN"].nunique()
perc_of_female = total_female_counts/df_players["SN"].nunique()*100

print(total_female_counts)
print('{:.2f}%'.format(perc_of_female))
print(str(round(perc_of_female,2))+"%")
```

    100
    17.45%
    17.45%
    

#### Percentage and Count of Other / Non-Disclosed


```python
other_counts = df_players[~df_players["Gender"].isin(['Male', "Female"])]["SN"].nunique()
perc_of_other = other_counts / df_players["SN"].nunique()*100
print(other_counts)
print('{:.2f}%'.format(perc_of_other))
```

    8
    1.40%
    

## Purchasing Analysis (Gender) 


```python
Total_price_by_Gender = pd.DataFrame(df_players.groupby("Gender")["Price"].sum())
Total_price_by_Gender
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Price</th>
    </tr>
    <tr>
      <th>Gender</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Female</th>
      <td>382.91</td>
    </tr>
    <tr>
      <th>Male</th>
      <td>1867.68</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>35.74</td>
    </tr>
  </tbody>
</table>
</div>




```python
Avg_price_by_Gender = pd.DataFrame(df_players.groupby("Gender")["Price"].mean().reset_index(name = "Avg. price"))
Avg_price_by_Gender
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Gender</th>
      <th>Avg. price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Female</td>
      <td>2.815515</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Male</td>
      <td>2.950521</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Other / Non-Disclosed</td>
      <td>3.249091</td>
    </tr>
  </tbody>
</table>
</div>



## Age Demographics


```python
###Adding new_col first to divide in to age groups###
max_age = df_players["Age"].max()
max_age
bins = np.arange(0,49,4)
bins
groups = ["0 to 4","5 to 8","9 to 12","13 to 16","17 to 20","21 to 24","25 to 28","29 to 32","33 to 36","37 to 40","41 to 44","45 to 48"]
groups
df_players["age_groups"] = pd.cut(df_players["Age"], bins, labels=groups)
df_players.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
      <th>age_groups</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>38</td>
      <td>Male</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>3.37</td>
      <td>Aelalis34</td>
      <td>37 to 40</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>Male</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>2.32</td>
      <td>Eolo46</td>
      <td>21 to 24</td>
    </tr>
    <tr>
      <th>2</th>
      <td>34</td>
      <td>Male</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>2.46</td>
      <td>Assastnya25</td>
      <td>33 to 36</td>
    </tr>
    <tr>
      <th>3</th>
      <td>21</td>
      <td>Male</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.36</td>
      <td>Pheusrical25</td>
      <td>21 to 24</td>
    </tr>
    <tr>
      <th>4</th>
      <td>23</td>
      <td>Male</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>Aela59</td>
      <td>21 to 24</td>
    </tr>
  </tbody>
</table>
</div>




```python
df_gender_price = pd.DataFrame(df_players.groupby(["age_groups"])["Price"].sum().reset_index(name = "Total Purchase Value"))
df_gender_price
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>age_groups</th>
      <th>Total Purchase Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0 to 4</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5 to 8</td>
      <td>61.34</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9 to 12</td>
      <td>81.25</td>
    </tr>
    <tr>
      <th>3</th>
      <td>13 to 16</td>
      <td>238.89</td>
    </tr>
    <tr>
      <th>4</th>
      <td>17 to 20</td>
      <td>468.03</td>
    </tr>
    <tr>
      <th>5</th>
      <td>21 to 24</td>
      <td>696.09</td>
    </tr>
    <tr>
      <th>6</th>
      <td>25 to 28</td>
      <td>309.37</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29 to 32</td>
      <td>202.09</td>
    </tr>
    <tr>
      <th>8</th>
      <td>33 to 36</td>
      <td>113.28</td>
    </tr>
    <tr>
      <th>9</th>
      <td>37 to 40</td>
      <td>107.35</td>
    </tr>
    <tr>
      <th>10</th>
      <td>41 to 44</td>
      <td>5.92</td>
    </tr>
    <tr>
      <th>11</th>
      <td>45 to 48</td>
      <td>2.72</td>
    </tr>
  </tbody>
</table>
</div>




```python
df_gender_count = pd.DataFrame(df_players.groupby(["age_groups"])["Price"].count().reset_index(name = "Purchase count"))
df_gender_count
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>age_groups</th>
      <th>Purchase count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0 to 4</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5 to 8</td>
      <td>22</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9 to 12</td>
      <td>24</td>
    </tr>
    <tr>
      <th>3</th>
      <td>13 to 16</td>
      <td>87</td>
    </tr>
    <tr>
      <th>4</th>
      <td>17 to 20</td>
      <td>161</td>
    </tr>
    <tr>
      <th>5</th>
      <td>21 to 24</td>
      <td>238</td>
    </tr>
    <tr>
      <th>6</th>
      <td>25 to 28</td>
      <td>104</td>
    </tr>
    <tr>
      <th>7</th>
      <td>29 to 32</td>
      <td>66</td>
    </tr>
    <tr>
      <th>8</th>
      <td>33 to 36</td>
      <td>38</td>
    </tr>
    <tr>
      <th>9</th>
      <td>37 to 40</td>
      <td>37</td>
    </tr>
    <tr>
      <th>10</th>
      <td>41 to 44</td>
      <td>2</td>
    </tr>
    <tr>
      <th>11</th>
      <td>45 to 48</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



### Normalised Totals


```python
Normalized_totals = age_groups["Price"].sum() / age_groups["SN"].nunique()
df_Normalized_totals = pd.DataFrame(Normalized_totals)
df_Normalized_totals
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
    </tr>
    <tr>
      <th>new_col</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0 to 4</th>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5 to 8</th>
      <td>4.718462</td>
    </tr>
    <tr>
      <th>9 to 12</th>
      <td>4.513889</td>
    </tr>
    <tr>
      <th>13 to 16</th>
      <td>3.732656</td>
    </tr>
    <tr>
      <th>17 to 20</th>
      <td>3.900250</td>
    </tr>
    <tr>
      <th>21 to 24</th>
      <td>3.742419</td>
    </tr>
    <tr>
      <th>25 to 28</th>
      <td>4.124933</td>
    </tr>
    <tr>
      <th>29 to 32</th>
      <td>4.592955</td>
    </tr>
    <tr>
      <th>33 to 36</th>
      <td>4.045714</td>
    </tr>
    <tr>
      <th>37 to 40</th>
      <td>4.879545</td>
    </tr>
    <tr>
      <th>41 to 44</th>
      <td>2.960000</td>
    </tr>
    <tr>
      <th>45 to 48</th>
      <td>2.720000</td>
    </tr>
  </tbody>
</table>
</div>



### Top Spenders



```python
# price_of_players = df_players["Price"]
top_spenders_SN = pd.DataFrame(df_players.groupby('SN')["Price"].sum().sort_values(ascending = False).head(5)).reset_index()
top_spenders_SN
# top_spenders["Purchase count"] = pd.DataFrame(df_players['SN'](df_players['SN'] == top_spenders['SN'].count()).reset_index()

top_spenders_count = pd.DataFrame(df_players[df_players['SN'].isin(top_spenders_SN['SN'])].groupby('SN')['SN'].count().reset_index(name = 'Purchase Count'))
top_spenders_count

                                    
top_spenders_final = pd.merge(top_spenders,top_spenders_count,on = "SN")
top_spenders_final['Average Purchase Price'] = top_spenders_3["Price"]/top_spenders_3["Purchase Count"]
top_spenders_final
# type(top_spenders_3)

```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>SN</th>
      <th>Price</th>
      <th>Purchase Count</th>
      <th>Average Purchase Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Undirrala66</td>
      <td>17.06</td>
      <td>5</td>
      <td>3.412000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Saedue76</td>
      <td>13.56</td>
      <td>4</td>
      <td>3.390000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Mindimnya67</td>
      <td>12.74</td>
      <td>4</td>
      <td>3.185000</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Haellysu29</td>
      <td>12.73</td>
      <td>3</td>
      <td>4.243333</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Eoda93</td>
      <td>11.58</td>
      <td>3</td>
      <td>3.860000</td>
    </tr>
  </tbody>
</table>
</div>



### Most Popular Item


```python
###Most Popular Items**
df_players_popular = pd.DataFrame(df_players.groupby(["Item ID","Item Name","Price"])["Item ID"].count().sort_values(ascending = False).head(5).reset_index(name = "Total Count"))
df_players_popular["Purchase Value"] = df_players_popular["Price"]*df_players_popular["Total Count"]
df_players_popular
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>Total Count</th>
      <th>Purchase Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>84</td>
      <td>Arcane Gem</td>
      <td>2.23</td>
      <td>11</td>
      <td>24.53</td>
    </tr>
    <tr>
      <th>1</th>
      <td>39</td>
      <td>Betrayal, Whisper of Grieving Widows</td>
      <td>2.35</td>
      <td>11</td>
      <td>25.85</td>
    </tr>
    <tr>
      <th>2</th>
      <td>31</td>
      <td>Trickster</td>
      <td>2.07</td>
      <td>9</td>
      <td>18.63</td>
    </tr>
    <tr>
      <th>3</th>
      <td>34</td>
      <td>Retribution Axe</td>
      <td>4.14</td>
      <td>9</td>
      <td>37.26</td>
    </tr>
    <tr>
      <th>4</th>
      <td>175</td>
      <td>Woeful Adamantite Claymore</td>
      <td>1.24</td>
      <td>9</td>
      <td>11.16</td>
    </tr>
  </tbody>
</table>
</div>



   ### Most Profitable item


```python
df_players_profitable = pd.DataFrame(df_players.groupby(["Item ID","Item Name","Price"])["Price"].sum().sort_values(ascending = False).head(5).reset_index(name = "Total Value"))
df_players_profitable
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>Total Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>34</td>
      <td>Retribution Axe</td>
      <td>4.14</td>
      <td>37.26</td>
    </tr>
    <tr>
      <th>1</th>
      <td>115</td>
      <td>Spectral Diamond Doomblade</td>
      <td>4.25</td>
      <td>29.75</td>
    </tr>
    <tr>
      <th>2</th>
      <td>32</td>
      <td>Orenmir</td>
      <td>4.95</td>
      <td>29.70</td>
    </tr>
    <tr>
      <th>3</th>
      <td>103</td>
      <td>Singed Scalpel</td>
      <td>4.87</td>
      <td>29.22</td>
    </tr>
    <tr>
      <th>4</th>
      <td>107</td>
      <td>Splitter, Foe Of Subtlety</td>
      <td>3.61</td>
      <td>28.88</td>
    </tr>
  </tbody>
</table>
</div>


