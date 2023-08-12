/* Question Link : https://leetcode.com/problems/classes-more-than-5-students/description/?envType=study-plan-v2&envId=top-sql-50 */

select class
from Courses
group by class
having count(student)>=5;