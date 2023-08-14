/* Question Link : https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/?envType=study-plan-v2&envId=top-sql-50 */

select t1.product_name,t2.net_count as unit
from Products t1
inner join
          (select product_id,sum(unit) as net_count
            from Orders
            where month(order_date)=02 and year(order_date)=2020
            group by product_id
            having net_count>=100
            order by product_id) t2
on t1.product_id=t2.product_id;