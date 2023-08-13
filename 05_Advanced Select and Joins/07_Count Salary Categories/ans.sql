/* Question Link : https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50 */

/* Question Link : https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50 */

/* SELECT
    SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS Low_Salary_Count,
    SUM(CASE WHEN income >= 20000 AND income <= 50000 THEN 1 ELSE 0 END) AS Average_Salary_Count,
    SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS High_Salary_Count
FROM Accounts; */


SELECT 'Low Salary' as category, Low_Salary_Count as accounts_count
FROM (SELECT
    SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS Low_Salary_Count FROM Accounts) q1

UNION

SELECT 'Average Salary' as category, Average_Salary_Count as accounts_count
FROM (SELECT
   SUM(CASE WHEN income between 20000 and 50000 THEN 1 ELSE 0 END) AS Average_Salary_Count FROM Accounts) q2

UNION

SELECT 'High Salary' as category, High_Salary_Count as accounts_count
FROM (SELECT
    SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS High_Salary_Count FROM Accounts) q2;