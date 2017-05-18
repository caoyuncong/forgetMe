DROP DATABASE IF EXISTS db_1702;
CREATE DATABASE db_1702;

USE db_1702;

SHOW TABLES;

DROP TABLE db_1702.course;

SHOW FULL COLUMNS FROM db_1702.student;

DROP TABLE IF EXISTS db_1702.student;
CREATE TABLE db_1702.student (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID',
  name   VARCHAR(255) UNIQUE
  COMMENT '姓名',
  intro  TEXT COMMENT '简介',
  gender CHAR(2) COMMENT '性别',
  age    INT UNSIGNED COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '身高',
  price  DECIMAL(6, 2) COMMENT '价格',
  dob    DATE COMMENT '出生日期', -- date of birth
  time   DATETIME COMMENT '时间'
);

INSERT INTO db_1702.student
VALUES (NULL, 'Tom', 'sdff', 'M', 4147483647, 1.7, 123.456, '1999-5-9', '2017-5-16 10:54:59');

DELETE FROM db_1702.student;


# SET FOREIGN_KEY_CHECKS = 0;

-- 课程表
DROP TABLE IF EXISTS db_1702.course;
CREATE TABLE db_1702.course (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) COMMENT '课程名',
  credit DOUBLE(3, 2) COMMENT '学分'
)
  COMMENT '课程表';

-- 选课表 学生<->课程
DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
  #   PRIMARY KEY (studentId, courseId)
);

INSERT INTO db_1702.course VALUES (NULL, 'Java SE', 4);
INSERT INTO db_1702.course VALUES (NULL, 'MySQL', 3);
INSERT INTO db_1702.course VALUES (NULL, NULL, 4);
INSERT INTO db_1702.course VALUES (NULL, NULL, 4);
INSERT INTO db_1702.course VALUES (NULL, NULL, 4);


INSERT INTO db_1702.student_course VALUES (NULL, 2, 1, NULL);
INSERT INTO db_1702.student_course VALUES (NULL, 2, 2, NULL);
INSERT INTO db_1702.student_course VALUES (NULL, 1, 2, NULL);

SELECT *
FROM db_1702.student;

SELECT *
FROM db_1702.course;

SHOW FULL COLUMNS FROM db_1702.student;

# TRUNCATE TABLE db_1702.student;

DELETE FROM db_1702.student;
SHOW FULL COLUMNS FROM db_1702.student;

SHOW VARIABLES LIKE 'char%';
SHOW VARIABLES LIKE 'coll%';

SELECT *
FROM db_1702.student;


