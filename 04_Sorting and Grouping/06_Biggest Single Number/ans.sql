/* Question Link : https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50 */

/* select num,count(num) as freq
from MyNumbers
group by num; */

select max(num) as num
from (select num,count(num) as freq
      from MyNumbers
      group by num) as t1
where freq=1;