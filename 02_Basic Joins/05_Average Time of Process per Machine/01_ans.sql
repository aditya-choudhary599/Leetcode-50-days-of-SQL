-- Question Link : https://leetcode.com/problems/average-time-of-process-per-machine/?envType=study-plan-v2&envId=top-sql-50

select A.machine_id,round(avg(B.timestamp-A.timestamp),3) AS processing_time
from Activity A,Activity B
where A.machine_id=B.machine_id and A.activity_type='start' and B.activity_type='end' and A.process_id=B.process_id
group by A.machine_id;