-- # Question Link : https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

select Product.product_name,Sales.year,Sales.price
from Product
inner join Sales
on Sales.product_id=Product.product_id;