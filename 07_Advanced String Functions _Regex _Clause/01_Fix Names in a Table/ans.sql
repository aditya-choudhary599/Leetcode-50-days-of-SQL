/* Question Link : https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50 */

select user_id,concat(upper(substring(name,1,1)),lower(substring(name,2,length(name)-1))) as name
from Users
order by user_id;