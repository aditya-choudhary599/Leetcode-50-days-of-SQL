/* Question Link : https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50 */

/* select employee_id,sum(case when primary_flag='Y' then 1 else 0 end) as yes_cnt,sum(case when primary_flag='N' then 1 else 0 end) as no_cnt
from Employee
group by employee_id
order by employee_id; */

select t1.employee_id,t1.department_id
from Employee t1
inner join 
          (select employee_id
          from Employee
          group by employee_id
          having sum(case when primary_flag='Y' then 1 else 0 end)=1) t2
on t1.employee_id=t2.employee_id
where t1.primary_flag='Y'

union

select t1.employee_id,t1.department_id
from Employee t1
inner join 
          (select employee_id
          from Employee
          group by employee_id
          having sum(case when primary_flag='N' then 1 else 0 end)=1 and sum(case when primary_flag='Y' then 1 else 0 end)=0) t2
on t1.employee_id=t2.employee_id
where t1.primary_flag='N';