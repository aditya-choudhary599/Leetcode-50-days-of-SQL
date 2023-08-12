-- Question Link : https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50

/* select product_id,min(year) as first_year,quantity,price
from Sales
group by product_id
order by product_id; */

select t2.product_id,t2.first_year,t1.quantity,t1.price
from Sales t1
inner join (select product_id,min(year) as first_year,quantity,price
            from Sales
            group by product_id
            order by product_id) as t2
on t2.product_id=t1.product_id and t1.year=t2.first_year;