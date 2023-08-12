/* # Question Link : https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

# select t2.player_id,t2.first_login,t1.event_date as second_login
# from Activity t1
# right join (select player_id,min(event_date) as first_login
#             from Activity
#             group by player_id
#             order by player_id) as t2
# on t1.player_id=t2.player_id and DATEDIFF(t1.event_date,t2.first_login)=1; */

select round(sum(case when t1.event_date is NOT NULL then 1 else 0 end)/count(t2.player_id),2) as fraction
from Activity t1
right join (select player_id,min(event_date) as first_login
            from Activity
            group by player_id
            order by player_id) as t2
on t1.player_id=t2.player_id and DATEDIFF(t1.event_date,t2.first_login)=1;
