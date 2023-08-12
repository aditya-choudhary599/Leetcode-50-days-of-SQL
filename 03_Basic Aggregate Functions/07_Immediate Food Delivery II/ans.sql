-- Question Link : https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50

SELECT ROUND((SUM(CASE WHEN od = cpdd THEN 1 ELSE 0 END) / COUNT(customer_id)) * 100, 2) AS immediate_percentage
FROM (
    SELECT customer_id,
           MIN(order_date) AS od,
           MIN(customer_pref_delivery_date) AS cpdd
    FROM Delivery
    GROUP BY customer_id
) AS subquery;

-- # Every derived table must have its own alias
