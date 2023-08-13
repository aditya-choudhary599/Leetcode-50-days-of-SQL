/* Question Link : https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50 */

/* SELECT reports_to, COUNT(name) AS reports_count, ROUND(AVG(age), 0) AS average_age
FROM Employees
GROUP BY reports_to
HAVING reports_to IS NOT NULL;
 */

select t2.reports_to as employee_id,t1.name,t2.reports_count,t2.average_age
  from Employees t1, 
  (SELECT reports_to, COUNT(name) AS reports_count, ROUND(AVG(age), 0) AS average_age
  FROM Employees
  GROUP BY reports_to
  HAVING reports_to IS NOT NULL) t2
where t1.employee_id=t2.reports_to
order by t2.reports_to;
