/* Question Link : https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50 */

/* select requester_id as f1,accepter_id as f2
from RequestAccepted

UNION ALL

select accepter_id as f1,requester_id as f2
from RequestAccepted; */

select f1 as id,count(distinct f2 ) as num
from 
    (select requester_id as f1,accepter_id as f2
      from RequestAccepted

      UNION ALL

      select accepter_id as f1,requester_id as f2
      from RequestAccepted) as subquery
group by f1
order by num desc
limit 1;
