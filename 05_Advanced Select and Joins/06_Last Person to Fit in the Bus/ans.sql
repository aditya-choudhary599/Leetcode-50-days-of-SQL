/* Question Link : https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT q1.person_name
FROM Queue q1
JOIN Queue q2 ON q2.turn <= q1.turn
GROUP BY q1.turn
having SUM(q2.weight)<=1000
ORDER BY q1.turn DESC
LIMIT 1;