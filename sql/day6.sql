CREATE OR REPLACE VIEW scott.v_emp
AS
  SELECT
    JOB,
    HIREDATE,
    SAL
  FROM scott.emp;

USE scott;
SHOW TABLES IN scott;

DROP VIEW scott.v_emp;

SELECT *
FROM scott.v_emp;

UPDATE scott.v_emp
SET HIREDATE = '1981-5-1'
WHERE HIREDATE = '1981-4-2';

SHOW DATABASES;
