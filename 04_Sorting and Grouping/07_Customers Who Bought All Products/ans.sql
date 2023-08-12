/* Question Link : https://leetcode.com/problems/customers-who-bought-all-products/  */

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING count(DISTINCT product_key) = (select count(product_key) from Product)
ORDER BY customer_id;
