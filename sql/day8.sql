SELECT *
FROM scott.dept;

CREATE VIEW scott.v_emp_10
AS
  SELECT *
  FROM scott.emp
  WHERE DEPTNO = 10;

SELECT *
FROM scott.v_emp_10;

SHOW FULL TABLES IN scott
WHERE table_type LIKE 'view';

SHOW FULL TABLES IN scott;

DROP VIEW scott.v_emp_10;

SHOW FULL COLUMNS FROM db_exam.course;
SHOW TABLE STATUS FROM db_exam;
SHOW CREATE TABLE db_exam.student;

SHOW CREATE VIEW scott.v_emp_10;

SELECT *
FROM scott.v_emp_10
WHERE JOB = 'manager';

SELECT *
FROM scott.emp
WHERE DEPTNO = 10 AND JOB = 'manager';

CREATE OR REPLACE VIEW scott.v_emp_dept
AS
  SELECT
    e.ENAME,
    d.DNAME
  FROM scott.emp e LEFT JOIN scott.dept d ON e.DEPTNO = d.DEPTNO;

SELECT *
FROM scott.v_emp_dept;

UPDATE scott.v_emp_dept
SET ENAME = 'scott new'
WHERE ENAME = 'scott';

CREATE VIEW scott.v_max
AS
  SELECT max(sal) max_sal
  FROM scott.emp;

SELECT *
FROM scott.v_max;

UPDATE scott.v_max
SET max_sal = 6000;

CREATE VIEW scott.v_union
AS
  SELECT ENAME
  FROM scott.emp
  WHERE DEPTNO = 10

  UNION

  SELECT ENAME
  FROM scott.emp
  WHERE DEPTNO = 20;

SELECT *
FROM scott.v_union;

UPDATE scott.v_union
SET ENAME = 'scott'
WHERE ENAME = 'scott new';

-- 事务 -----------------
START TRANSACTION;

SELECT *
FROM scott.emp;

TRUNCATE TABLE scott.emp;

DELETE FROM scott.emp;

ROLLBACK;

--  事务
START TRANSACTION;

UPDATE scott.emp
SET SAL = SAL + 1000
WHERE ENAME = 'allen';

UPDATE scott.emp
SET SAL = SAL - 1000
WHERE ENAME = 'ward';

COMMIT;

ROLLBACK;

SELECT *
FROM scott.emp;

-- save point 保留点
START TRANSACTION;

UPDATE scott.emp
SET ENAME = 'allen'
WHERE EMPNO = 7499;

SAVEPOINT a;

DELETE FROM scott.emp
WHERE EMPNO = 7499;

SAVEPOINT b;

INSERT INTO scott.emp (EMPNO, ENAME)
VALUES (1234, 'tester');

SAVEPOINT c;

DELETE FROM scott.emp;

COMMIT ;
ROLLBACK TO c;
ROLLBACK ;

SELECT *
FROM scott.emp;
