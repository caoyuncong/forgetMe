SELECT *
FROM scott.emp
LIMIT 3 OFFSET 0;

SELECT *
FROM scott.emp
LIMIT 3, 4;

SELECT *
FROM scott.emp
ORDER BY ENAME
LIMIT 4 OFFSET 3;

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-b]+';

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%'; -- like

INSERT INTO scott.emp (ENAME, EMPNO) VALUES (222, 'A_ADAMS');

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%\_%' ESCAPE '\\';

SELECT *
FROM scott.emp
WHERE DEPTNO NOT IN (10, 20);

SELECT *
FROM scott.emp
WHERE JOB NOT IN ('manager', 'clerk');

SELECT *
FROM scott.emp
WHERE SAL BETWEEN 2000 AND 3000;

# 1. 返回拥有员工的部门名、部门号
SELECT
  d.DNAME,
  d.DEPTNO
FROM scott.emp e
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

# 2. 返回员工和所属经理的姓名
SELECT
  e1.ENAME,
  e2.ENAME
FROM scott.emp e1
  INNER JOIN scott.emp e2
    ON e1.MGR = e2.EMPNO;

SELECT *
FROM scott.dept;

SELECT
  ENAME,
  DNAME
FROM scott.emp e LEFT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
UNION ALL
SELECT
  ENAME,
  DNAME
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

# id =1学生选了那些课
SELECT
  s.name,
  c.title
FROM db_exam.student s
  INNER JOIN db_exam.course c
  INNER JOIN db_exam.student_course sc
    ON s.id = sc.studentId AND c.id = sc.courseId
WHERE s.id = 1;

# id =2 课有那些学生选
SELECT
  c.title,
  s.name
FROM db_exam.student s
  INNER JOIN db_exam.course c
  INNER JOIN db_exam.student_course sc
    ON s.id = sc.studentId AND c.id = sc.courseId
WHERE c.id = 2;

# 所有学生获得的总学分
SELECT
  c.title,
  s.name,
  c.credit
FROM db_exam.student s
  INNER JOIN db_exam.course c
  INNER JOIN db_exam.student_course sc
    ON s.id = sc.studentId AND c.id = sc.courseId;

DROP DATABASE scott;
SHOW DATABASES;