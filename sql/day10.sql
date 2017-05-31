SELECT
  count(SAL),
  min(SAL),
  max(SAL),
  avg(SAL),
  sum(SAL)
FROM scott.emp;

SELECT count(ENAME)
FROM scott.emp;

SELECT count(HIREDATE)
FROM scott.emp;

SELECT min(ENAME)
FROM scott.emp;

SELECT max(ENAME)
FROM scott.emp;

SELECT password
FROM db_1702.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10;

SHOW CREATE TABLE db_1702.csdn;

SELECT *
FROM scott.emp;

SELECT substr(ENAME, 2)
FROM scott.emp;

SELECT substr(email, locate('@', email))
FROM db_1702.csdn
GROUP BY 1
ORDER BY count(1)
LIMIT 10;

SELECT
  JOB,
  DEPTNO,
  max(SAL)
FROM scott.emp
GROUP BY DEPTNO, JOB;

SELECT CONCAT('hello', ', ', 'world', '!');

SELECT *
FROM db_1702.csdn;

SELECT *
FROM db_1702.csdn
WHERE email = '123@qq.com';

CREATE INDEX idx_email
  ON db_1702.csdn (email);

DESC db_1702.csdn;

-- 函数-----------
SELECT date_add(now(), INTERVAL 31 DAY);

-- index ----

CREATE INDEX idx_password
  ON db_1702.csdn (password);

SHOW INDEX FROM db_1702.csdn;

DROP INDEX idx_email
ON db_1702.csdn;



