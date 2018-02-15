-- SILVER CHALLENGES
-- -----------------

-- 3. Disaster, we've heard from Steve Johnson's lawyers.
--  He claims that Michael Mitchell was hired on the same day as him,
--  but was hired later in the day. Mitchell should have been let go, not him.
--  Confirm this by extending the number of results and make sure nobody else was
--  hired on that day.
--  Then modify the query to return the correct 3 people.
--  Continue to use HireDate as the primary sort column, but use EmployeeId as the tie breaker.
--  Assume that a higher EmployeeId means they were hired later.
--  Expected : 3 rows (starting with the following)
--   8	  Laura	  Callahan	  2004-03-04 00:00:00
--   7	  Robert	King	      2004-01-02 00:00:00
--   6	  Michael	Mitchell	  2003-10-17 00:00:00

SELECT EmployeeId, LastName, FirstName, HireDate from Employee
ORDER BY HireDate desc, EmployeeId desc;
