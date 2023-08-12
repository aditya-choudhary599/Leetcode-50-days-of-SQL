-- Question Link : https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/?envType=study-plan-v2&envId=top-sql-50

SELECT teacher_id, COUNT(DISTINCT subject_id) as cnt
FROM Teacher
GROUP BY teacher_id
ORDER BY teacher_id;
