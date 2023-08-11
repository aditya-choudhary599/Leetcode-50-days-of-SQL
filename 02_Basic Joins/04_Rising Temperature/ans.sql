/* # Question Link : https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

Example of Self Join 
 */
 
select B.id
from Weather A,Weather B
where A.temperature<B.temperature and (DATEDIFF(B.recordDate, A.recordDate)) = 1;