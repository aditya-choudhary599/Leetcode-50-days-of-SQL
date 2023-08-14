/* Question Link : https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50 */

select employee_id
from Employees
where salary<30000 and manager_id not in (select employee_id from Employees)
order by employee_id;