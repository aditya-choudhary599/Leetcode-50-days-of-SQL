/* Question Link : https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50 */

select *,(case when x+y>z and x+z>y and y+z>x then 'Yes' ELSE 'No' END) as triangle
from Triangle;