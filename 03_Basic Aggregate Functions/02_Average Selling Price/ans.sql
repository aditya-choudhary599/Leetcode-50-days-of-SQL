-- Question Link : https://leetcode.com/problems/average-selling-price/description/

SELECT p.product_id, ROUND(SUM(units*price)/SUM(units),2) AS average_price
FROM Prices p 
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND
u.purchase_date BETWEEN start_date AND end_date
group by product_id;