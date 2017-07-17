
Data Comparison
===============

Date comparison run: 2017-07-17 11:41:20  
Comparison run on R version 3.4.1 (2017-06-30)  
With dataCompareR version 0.1.0  


Meta Summary
============


|Dataset Name |Number of Rows |Number of Columns |
|:------------|:--------------|:-----------------|
|iris         |150            |5                 |
|iris2        |130            |5                 |


Variable Summary
================

Number of columns in common: 5  
Number of columns only in iris: 0  
Number of columns only in iris2: 0  
Number of columns with a type mismatch: 0  
No match key used, comparison is by row



Row Summary
===========

Total number of rows read from iris: 150  
Total number of rows read from iris2: 130    
Number of rows in common: 130  
Number of rows dropped from iris: 20  
Number of rows dropped from  iris2: 0  


Data Values Comparison Summary
==============================

Number of columns compared with ALL rows equal: 4  
Number of columns compared with SOME rows unequal: 1  
Number of columns with missing value differences: 0  

Columns with all rows equal : PETAL.LENGTH, PETAL.WIDTH, SEPAL.WIDTH, SPECIES

Summary of columns with some rows unequal: 



|Column       |Type (in iris) |Type (in iris2) | # differences|Max difference | # NAs|
|:------------|:--------------|:---------------|-------------:|:--------------|-----:|
|SEPAL.LENGTH |double         |double          |             2|0.3            |     0|



Unequal column details
======================



#### Column -  SEPAL.LENGTH



|   | SEPAL.LENGTH (iris)| SEPAL.LENGTH (iris2)|Type (iris) |Type (iris2) | Difference|
|:--|-------------------:|--------------------:|:-----------|:------------|----------:|
|2  |                 4.9|                  5.2|double      |double       |       -0.3|
|1  |                 5.1|                  5.2|double      |double       |       -0.1|


