-- Databricks notebook source
-- MAGIC %sql
-- MAGIC select * from emp_attrition

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Total Employee Count

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC select sum(EmployeeCount) from emp_attrition

-- COMMAND ----------

-- MAGIC %md
-- MAGIC FIND OUR ATTRITION DIVISION

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC SELECT SUM(EmployeeCount) FROM emp_attrition GROUP BY Attrition

-- COMMAND ----------

-- MAGIC %md
-- MAGIC AGE Analysis -- lets find out which particular age attrition is high (18-24,25-31,32-38,39-45,46-52,52+)

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC SELECT SUM(EmployeeCount),
-- MAGIC case when age BETWEEN 20 and 25 then '20-25' when age BETWEEN 26 and 32 then '26-32' when age BETWEEN 33 and 40 then '33-40' else '40+' end age_group
-- MAGIC FROM emp_attrition where Attrition = 'Yes' group by 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # most of the people are leaving the org between 26-32

-- COMMAND ----------

-- MAGIC %md
-- MAGIC FIND OUT Attrition by Department
-- MAGIC

-- COMMAND ----------

select count(EmployeeCount),department from emp_attrition where Attrition = 'Yes' group by Department;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by education (1-below college, 2-college, 3-bachelor, 4-masters,5-doctor)

-- COMMAND ----------

select count(EmployeeCount),
case when Education = 1 then 'below college' when Education=2 then 'college' when Education=3 then 'bachelor' when Education=4 then 'master' else 'doctor' end ed_group
 from  emp_attrition where Attrition = 'Yes' group by Education

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by Environment Satisfaction (1-low, 2-medium, 3-high,4-higly satisfied)

-- COMMAND ----------

select count(EmployeeCount),
EnvironmentSatisfaction
from  emp_attrition where Attrition = 'Yes' group by EnvironmentSatisfaction

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by business travel

-- COMMAND ----------

select count(EmployeeCount), BusinessTravel from emp_attrition where Attrition = 'Yes' group by 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Insights we got as of now:
-- MAGIC
-- MAGIC 1.employee age between 26-32 leaving organization more.
-- MAGIC 2.research and devlopment department left the organization.
-- MAGIC 3.41.8% people having bachelors degree left org.
-- MAGIC 4.72 employee not satisfied with environment location left org.
-- MAGIC 5.156 employee travelling rarely left org.
-- MAGIC
