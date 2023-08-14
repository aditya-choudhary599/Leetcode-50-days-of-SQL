/* Question Link : https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT MAX(salary) SecondHighestSalary FROM Employee 
WHERE salary < (SELECT MAX(salary) FROM Employee);