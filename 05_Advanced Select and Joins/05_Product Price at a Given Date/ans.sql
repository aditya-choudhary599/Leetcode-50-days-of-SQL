# Write your MySQL query statement below

/* Question Link : https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50 */

/* select *
from Products
where change_date<='2019-08-16'; */

/* select product_id,max(change_date) as latest_date
from 
    (select *
    from Products
    where change_date<='2019-08-16') as p
group by(product_id)
order by(product_id); */

SELECT DISTINCT
    t1.product_id,
    CASE
        WHEN t1.product_id NOT IN (
            SELECT product_id
            FROM Products
            WHERE change_date <= '2019-08-16'
        ) THEN 10
        ELSE t1.new_price
    END AS price

FROM Products t1

LEFT JOIN (
    SELECT product_id, MAX(change_date) AS latest_date
    FROM (
        SELECT *
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) AS p
    GROUP BY product_id
) t2 
ON t1.product_id = t2.product_id AND t1.change_date = t2.latest_date
WHERE t2.latest_date IS NOT NULL OR 
                                    t1.product_id NOT IN (
                                      SELECT product_id
                                      FROM Products
                                      WHERE change_date <= '2019-08-16'
                                  );



