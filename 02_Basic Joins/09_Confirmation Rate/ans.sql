-- Question Link : https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50

select S.user_id
, round(
    avg(case when action = 'confirmed' then 1 else 0 end),
    2) as confirmation_rate
from Signups S 
left join Confirmations C 
on S.user_id=C.user_id
group by S.user_id;