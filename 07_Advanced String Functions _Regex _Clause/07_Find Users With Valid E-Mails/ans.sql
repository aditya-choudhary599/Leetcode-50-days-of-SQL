/* Question Link : https://leetcode.com/problems/find-users-with-valid-e-mails/ */

SELECT *
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_\.\-]*@leetcode(\\?com)?\\.com$';