/* Question Link : https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50 */

/* select *,(case when id%2!=0 and id+1 in (select id from Seat) then LEAD(student,1) over (order by id) 
                when id%2=0 and id-1 in (select id from Seat) then LAG(student,1) over (order by id)
                else student end) as new_student
from Seat; */

select id,new_student as student
from 
      (select *,(case when id%2!=0 and id+1 in (select id from Seat) then LEAD(student,1) over (order by id) 
                      when id%2=0 and id-1 in (select id from Seat) then LAG(student,1) over (order by id)
                      else student end) as new_student
      from Seat) as subquery
order by id;