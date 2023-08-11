-- # Write your MySQL query statement below

-- # Question Link : https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

select Employee.name,Bonus.bonus
from Employee
left join Bonus
on Employee.empId=Bonus.empId
where Bonus.bonus is NULL or Bonus.bonus<1000;