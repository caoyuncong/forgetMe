SHOW DATABASES;

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
  #     ON e.DEPTNO = d.DEPTNO;
  USING (DEPTNO); -- 主键名与从键名一样


