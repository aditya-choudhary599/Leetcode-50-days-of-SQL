/* Question Link : https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&envId=top-sql-50 */

select user_id,count(distinct follower_id) as followers_count
from Followers
group by user_id
order by user_id;