/* Question Link : https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50 */


SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num
    FROM Logs
) t
WHERE num = next_num AND num = prev_num;

/* Explanation of the query:

    In the inner subquery, the LEAD and LAG window functions are used to retrieve the next and previous values of the num column, respectively, based on the id ordering.

    The outer query then filters the rows where the current value of num is equal to both the next and previous values, which indicates that the number appears at least three times consecutively.

    The DISTINCT keyword is used to ensure that each consecutive number is only listed once in the result. */