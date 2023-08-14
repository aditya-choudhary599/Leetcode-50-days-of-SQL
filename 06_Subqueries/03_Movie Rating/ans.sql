/* # Question Link : https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT MIN(u.name) AS results
FROM Users u
JOIN (
    SELECT user_id
    FROM MovieRating
    GROUP BY user_id
    HAVING COUNT(created_at) = (
        SELECT MAX(rating_count) 
        FROM (
            SELECT user_id, COUNT(created_at) AS rating_count
            FROM MovieRating
            GROUP BY user_id
        ) AS user_rating_counts
    )
) mr 
ON u.user_id = mr.user_id

UNION ALL

SELECT MIN(m.title) AS results
FROM Movies m
JOIN (
    SELECT movie_id
    FROM MovieRating
    WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020
    GROUP BY movie_id
    HAVING round(AVG(rating),3) = (
        SELECT MAX(helper)
        FROM (
            SELECT movie_id, round(AVG(rating),3) AS helper
            FROM MovieRating
            WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020
            GROUP BY movie_id
        ) as subquery
    )
) mr ON m.movie_id = mr.movie_id;