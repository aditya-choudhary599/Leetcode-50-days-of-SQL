/* Question Link : https://leetcode.com/problems/department-top-three-salaries/description/?envType=study-plan-v2&envId=top-sql-50 */

/* SELECT
    departmentId,
    GROUP_CONCAT(distinct salary ORDER BY salary DESC SEPARATOR ',') AS helper
FROM
    Employee
GROUP BY
    departmentId;
 */

/* SELECT departmentId,
       SUBSTRING_INDEX(helper, ',', 1) AS first_max_value,
       SUBSTRING_INDEX(SUBSTRING_INDEX(helper, ',', 2), ',', -1) AS second_max_value,
       SUBSTRING_INDEX(SUBSTRING_INDEX(helper, ',', 3), ',', -1) AS third_max_value
FROM (
    SELECT departmentId,
           GROUP_CONCAT(DISTINCT salary ORDER BY salary DESC SEPARATOR ',') AS helper
    FROM Employee
    GROUP BY departmentId
) AS subq;
 */

/* SELECT e1.name, e1.salary, e1.departmentId
FROM Employee e1
INNER JOIN (
    SELECT departmentId,
           SUBSTRING_INDEX(helper, ',', 1) AS first_max_value,
           SUBSTRING_INDEX(SUBSTRING_INDEX(helper, ',', 2), ',', -1) AS second_max_value,
           SUBSTRING_INDEX(SUBSTRING_INDEX(helper, ',', 3), ',', -1) AS third_max_value
    FROM (
        SELECT departmentId,
               GROUP_CONCAT(DISTINCT salary ORDER BY salary DESC SEPARATOR ',') AS helper
        FROM Employee
        GROUP BY departmentId
    ) AS subq1
) AS e2
ON e1.departmentId = e2.departmentId
where e1.salary = e2.first_max_value 
   OR e1.salary = e2.second_max_value 
   OR e1.salary = e2.third_max_value */

select t1.name as Department,t2.name as Employee,t2.salary as Salary
from Department t1
inner join 
          (SELECT e1.name, e1.salary, e1.departmentId
FROM Employee e1
INNER JOIN (
    SELECT departmentId,
           SUBSTRING_INDEX(helper, ',', 1) AS first_max_value,
           SUBSTRING_INDEX(SUBSTRING_INDEX(helper, ',', 2), ',', -1) AS second_max_value,
           SUBSTRING_INDEX(SUBSTRING_INDEX(helper, ',', 3), ',', -1) AS third_max_value
    FROM (
        SELECT departmentId,
               GROUP_CONCAT(DISTINCT salary ORDER BY salary DESC SEPARATOR ',') AS helper
        FROM Employee
        GROUP BY departmentId
    ) AS subq1
) AS e2
ON e1.departmentId = e2.departmentId
where e1.salary = e2.first_max_value 
   OR e1.salary = e2.second_max_value 
   OR e1.salary = e2.third_max_value) t2

where t1.id=t2.departmentId
order by t1.id;