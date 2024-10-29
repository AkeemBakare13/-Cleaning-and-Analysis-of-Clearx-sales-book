select*
from `sales data clearx`
limit 160000
;

-- looking for duplicates

select *, row_number() over(
partition by `ï»¿Date`,ProductCategory,ProductName,
UnitPrice,Quantity,Revenue,CostPrice,ProfitMargin,
EconomicCondition,CompetitionLevel,MarketingCampaign,
Branch,CustomerID,Gender,Age,Location,PurchaseFrequency,AveragePurchaseAmount)
from `sales data clearx`
limit 160000
;

with cte_dup as (
select *, row_number() over(
partition by `ï»¿Date`,ProductCategory,ProductName,
UnitPrice,Quantity,Revenue,CostPrice,ProfitMargin,
EconomicCondition,CompetitionLevel,MarketingCampaign,
Branch,CustomerID,Gender,Age,Location,PurchaseFrequency,AveragePurchaseAmount) as row_num
from `sales data clearx`
limit 160000
)
select * 
from cte_dup
where row_num > 1
;

-- looking for null values

select *
from `sales data clearx`
limit 160000
;

select *
from `sales data clearx`
where `ï»¿Date` is null
or `ï»¿Date` = ''
;

select *
from `sales data clearx`
where ProductCategory is null
or ProductCategory = ''
;
select *
from `sales data clearx`
where ProductName is null
or ProductName = ''
;

select *
from `sales data clearx`
where UnitPrice is null
or UnitPrice = ''
;

select *
from `sales data clearx`
where Quantity is null
or Quantity = ''
;

select *
from `sales data clearx`
where Revenue is null
or Revenue = ''
;

select *
from `sales data clearx`
where CostPrice is null
or CostPrice = ''
;

select *
from `sales data clearx`
where ProfitMargin is null
or ProfitMargin = ''
;

select ProfitMargin
from `sales data clearx`
limit 160000
;

select *
from `sales data clearx`
where EconomicCondition is null
or EconomicCondition = ''
;

select *
from `sales data clearx`
where CompetitionLevel is null
or CompetitionLevel = ''
;

select *
from `sales data clearx`
where MarketingCampaign is null
or MarketingCampaign = ''
;

select *
from `sales data clearx`
where Branch is null
or Branch = ''
;

select *
from `sales data clearx`
where CustomerID is null
or CustomerID = ''
;

select *
from `sales data clearx`
where Gender is null
or Gender = ''
;

select *
from `sales data clearx`
where Age is null
or Age = ''
;

select *
from `sales data clearx`
where Location is null
or Location = ''
;

select *
from `sales data clearx`
where PurchaseFrequency is null
or PurchaseFrequency = ''
;

select *
from `sales data clearx`
where AveragePurchaseAmount is null
or AveragePurchaseAmount = ''
;

-- standardization

select `ï»¿Date`
from `sales data clearx`
limit 160000
;

alter table `sales data clearx`
modify column `ï»¿Date` date;

select ProductCategory
from `sales data clearx`
limit 160000
;

select ProductCategory, trim(ProductCategory) as ProductCategory
from `sales data clearx`
limit 160000
;

select distinct ProductCategory
from `sales data clearx`
limit 160000
;

select ProductName
from `sales data clearx`
limit 160000
;

select ProductName, trim(ProductName) as ProductName
from `sales data clearx`
limit 160000
;

select distinct ProductName
from `sales data clearx`
order by 1
limit 160000
;

select UnitPrice
from `sales data clearx`
limit 160000
;

select Quantity
from `sales data clearx`
limit 160000
;

select distinct Quantity
from `sales data clearx`
limit 160000
;

select Revenue
from `sales data clearx`
limit 160000
;

select CostPrice
from `sales data clearx`
limit 160000
;

select CostPrice, round(CostPrice,2)
from `sales data clearx`
limit 160000
;

update `sales data clearx`
set CostPrice = round(CostPrice,2)
;

select CostPrice
from `sales data clearx`
limit 160000
;

select ProfitMargin
from `sales data clearx`
limit 160000
;

select ProfitMargin, round(ProfitMargin,2)
from `sales data clearx`
limit 160000
;

update `sales data clearx`
set ProfitMargin = round(ProfitMargin,2);

select ProfitMargin
from `sales data clearx`
limit 160000
;


select EconomicCondition
from `sales data clearx`
limit 160000
;

select distinct EconomicCondition
from `sales data clearx`
limit 160000
;

select CompetitionLevel
from `sales data clearx`
limit 160000
;

select distinct CompetitionLevel
from `sales data clearx`
limit 160000
;

select MarketingCampaign
from `sales data clearx`
limit 160000
;

select distinct MarketingCampaign
from `sales data clearx`
limit 160000
;

select Branch
from `sales data clearx`
limit 160000
;

select distinct Branch
from `sales data clearx`
limit 160000
;

select CustomerID
from `sales data clearx`
limit 160000
;

select Gender
from `sales data clearx`
limit 160000
;
select distinct Gender
from `sales data clearx`
limit 160000
;

select Age
from `sales data clearx`
limit 160000
;

select Location
from `sales data clearx`
limit 160000
;

select distinct Location
from `sales data clearx`
limit 160000
;

select PurchaseFrequency
from `sales data clearx`
limit 160000
;

select AveragePurchaseAmount
from `sales data clearx`
limit 160000
;

select * 
from `sales data clearx`
limit 160000
;


-- Data Analysis

select * 
from `sales data clearx`
limit 160000
;

select distinct ProductName, ProductCategory, avg(ProfitMargin) over(partition by ProductName)
from `sales data clearx`
order by 2
limit 160000
;

select distinct location, ProductName, ProductCategory,avg(ProfitMargin) over(partition by ProductName)
from `sales data clearx`
order by 2
limit 160000
;

select revenue, CostPrice, ROUND(((Revenue - CostPrice)/revenue),2) as profM, ProfitMargin
from `sales data clearx`
limit 160000
;

select ProductName, year(`ï»¿Date`) as yearly, sum(Quantity) 
from `sales data clearx`
where Branch = 'Branch A'
group by ProductName, yearly
order by 2
limit 160000
;

select ProductName, year(`ï»¿Date`) as yearly, sum(Quantity) 
from `sales data clearx`
where Branch = 'Branch B'
group by ProductName, yearly
order by 2
limit 160000
;

select ProductName, year(`ï»¿Date`) as yearly, avg(ProfitMargin) 
from `sales data clearx`
where Branch = 'Branch C'
group by ProductName, yearly
order by 2
limit 160000
;


select MAX(age), min(age)
from `sales data clearx`
order by age desc
limit 160000
;

select 
*,
case
	when age < 31 then '18-30'
    when age < 41 then '31-40'
    when age < 51 then '41-50'
    when age > 50 then '51-65'
end  as age_difference
from `sales data clearx`
order by age desc
limit 160000
;

with cte_age_bracket as (
select 
*,
case
	when age < 31 then '18-30'
    when age < 41 then '31-40'
    when age < 51 then '41-50'
    when age > 50 then '51-65'
end  as age_difference
from `sales data clearx`
order by age desc
limit 160000
)
select age_difference, year(`ï»¿Date`), branch, avg(quantity)
from cte_age_bracket
group by age_difference, year(`ï»¿Date`), branch
order by 3
;

select Branch, avg(ProfitMargin)
from `sales data clearx`
group by branch
;


select * 
from `sales data clearx`
limit 160000
;

-- CONSIDERING LOCATIONS

select  count(CustomerID)
from `sales data clearx`
limit 160000
;

select distinct location, count(CustomerID)
from `sales data clearx`
group by location
limit 160000
;

select distinct location, year(ï»¿Date), count(CustomerID)
from `sales data clearx`
group by location, year(ï»¿Date)
order by 1
limit 160000
;

select distinct Branch, location, year(ï»¿Date), count(CustomerID)
from `sales data clearx`
group by Branch, location, year(ï»¿Date)
order by 1
limit 160000
;

-- products with the most custoners 
select distinct ProductName,  count(CustomerID)
from `sales data clearx`
group by ProductName
order by 2 desc
limit 160000
;

-- check for products with the most custoners by locatin
-- check for products with the most amount of customers by branch
-- check for products with the most amount of customers by age_range

-- products with the most custoners by locatin
select distinct ProductName, location, count(CustomerID)
from `sales data clearx`
group by ProductName, location
order by 3 desc
limit 160000
;

-- products with the most custoners by branch
select distinct ProductName, ProductCategory, branch, count(CustomerID)
from `sales data clearx`
group by ProductName, ProductCategory, branch
order by 4 desc
limit 160000
;

-- products with the most custoners by branch and location
select distinct ProductName, ProductCategory, branch, location, count(CustomerID) as total_no_of_customers
from `sales data clearx`
group by ProductName, ProductCategory, branch, location
order by 5 desc
limit 160000
;

-- products with the most custoners by age_range

with cte_age_bracket as (
select 
*,
case
	when age < 31 then '18-30'
    when age < 41 then '31-40'
    when age < 51 then '41-50'
    when age > 50 then '51-65'
end  as age_range
from `sales data clearx`
order by age desc
limit 160000
)
select distinct ProductName, ProductCategory, age_range, branch, location, count(CustomerID) as total_no_of_customers
from cte_age_bracket
group by ProductName, ProductCategory, age_range, branch, location
order by 6 desc
limit 160000
;



-- products with the most quantity by location
select distinct ProductName, ProductCategory, sum(quantity) as quantity, round(sum(unitprice),2) as UnitPrice, round(sum(Revenue),2) as revenue, round(sum(ProfitMargin),2) as ProfitMargin
from `sales data clearx`
group by ProductName, ProductCategory
order by 3 desc
limit 160000
;

select *
from `sales data clearx`
limit 160000
;


with cte_age_diff as (
select 
*,
case
	when age < 31 then '18-30'
    when age < 41 then '31-40'
    when age < 51 then '41-50'
    when age > 50 then '51-65'
end  as age_difference
from `sales data clearx`
order by age desc
limit 160000
)
select distinct ProductName, age_difference,
ProductCategory, sum(quantity) as quantity,
 round(sum(unitprice),2) as UnitPrice, 
 round(sum(Revenue),2) as revenue, 
 round(sum(ProfitMargin),2) as ProfitMargin
from cte_age_diff
group by ProductName, ProductCategory, age_difference
order by 4 desc
limit 160000
;

with cte_age_diff as (
select 
*,
case
	when age < 31 then '18-30'
    when age < 41 then '31-40'
    when age < 51 then '41-50'
    when age > 50 then '51-65'
end  as age_difference
from `sales data clearx`
order by age desc
limit 160000
)
select distinct ProductName, age_difference,
ProductCategory, sum(quantity) as quantity,
 round(sum(unitprice),2) as UnitPrice, 
 round(sum(Revenue),2) as revenue, 
 round(sum(ProfitMargin),2) as ProfitMargin, year(ï»¿Date)
from cte_age_diff
group by ProductName, ProductCategory, age_difference, year(ï»¿Date)
order by 4 desc
limit 160000
;

with cte_age_diff as (
select 
*,
case
	when age < 31 then '18-30'
    when age < 41 then '31-40'
    when age < 51 then '41-50'
    when age > 50 then '51-65'
end  as age_difference
from `sales data clearx`
order by age desc
limit 160000
)
select distinct ProductName, age_difference,
ProductCategory, sum(quantity) as quantity,
 round(sum(unitprice),2) as UnitPrice, 
 round(sum(Revenue),2) as revenue, 
 round(sum(ProfitMargin),2) as ProfitMargin, year(ï»¿Date), branch, location
from cte_age_diff
group by ProductName, ProductCategory, age_difference, year(ï»¿Date),branch, location
order by 4 desc
limit 160000
;


-- CONSIDERING TOTAL SALES

select * from `sales data clearx`
limit 160000;

select UnitPrice, quantity, UnitPrice*Quantity
from `sales data clearx`
limit 160000
;
with cte_total as (
select *, UnitPrice*Quantity as sales
from `sales data clearx`
limit 160000
)
select branch, round(sum(UnitPrice),2) as TotalUnitPrice, sum(quantity) as totalQuantity, round(sum(sales),2) as totalSales
from cte_total
group by branch
;

with cte_total as (
select *, UnitPrice*Quantity as sales
from `sales data clearx`
limit 160000
)
select branch, location, round(sum(UnitPrice),2) as TotalUnitPrice, sum(quantity) as totalQuantity, round(sum(sales),2) as totalSales
from cte_total
group by branch,location
order by 5 desc
;
