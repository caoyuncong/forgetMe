SHOW DATABASES;
USE db_1702;
SHOW TABLES;

SHOW FULL COLUMNS FROM db_1702.student;
SHOW FULL COLUMNS FROM db_1702.course;
SHOW FULL COLUMNS FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

SELECT *
FROM db_1702.course;

SELECT *
FROM db_1702.student_course;

TRUNCATE TABLE db_1702.student_course;

DELETE FROM db_1702.course
WHERE id > 2;

INSERT INTO db_1702.student
VALUES (NULL, 'Jerry', 'sdff', 'M', 4147483647, 1.7, 123.456, '1999-5-9', '2017-5-16 10:54:59');

SELECT *
FROM db_1702.course;

DELETE FROM db_1702.student;

-- 选课表 学生<->课程
DROP TABLE IF EXISTS db_1702.student_course;
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
);

ALTER TABLE db_1702.student_course
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)
REFERENCES db_1702.student (id)
  ON DELETE NO ACTION; -- a href hyper reference

ALTER TABLE db_1702.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_1702.course (id)
  ON DELETE SET NULL;

SELECT *
FROM db_1702.student_course;

SELECT *
FROM db_1702.course;

SHOW FULL COLUMNS FROM db_1702.student_course;

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 1, NULL);

DROP TABLE db_1702.student;

SHOW CREATE TABLE db_1702.student_course;

CREATE TABLE `student_course` (
  `id`        INT(11) NOT NULL AUTO_INCREMENT
  COMMENT 'PK',
  `studentId` INT(11)          DEFAULT NULL
  COMMENT '学生 ID',
  `courseId`  INT(11)          DEFAULT NULL
  COMMENT '课程 ID',
  `score`     INT(11)          DEFAULT NULL
  COMMENT '考试成绩',
  PRIMARY KEY (`id`),
  KEY `fk_student_course_studentId` (`studentId`),
  KEY `fk_student_course_courseId` (`courseId`),
  CONSTRAINT `fk_student_course_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`)
    ON DELETE SET NULL,
  CONSTRAINT `fk_student_course_studentId` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
    ON DELETE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

SHOW FULL COLUMNS FROM db_1702.student_course;

DELETE FROM db_1702.student_course;

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 2, NULL);

DELETE FROM db_1702.course;

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 3, NULL);

SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student;

SHOW FULL COLUMNS FROM db_1702.student_course;

SELECT *
FROM db_1702.student_course;

SELECT *
FROM db_1702.student;

DROP TABLE IF EXISTS db_1702.test;
CREATE TABLE db_1702.test (
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  col VARCHAR(255) COMMENT 'test column'
);


ALTER TABLE db_1702.new_test
  RENAME db_1702.test;

ALTER TABLE db_1702.test
  ADD COLUMN col3 INT
  FIRST;

ALTER TABLE db_1702.test
  DROP COLUMN col3;

ALTER TABLE db_1702.test
  MODIFY COLUMN col INT FIRST;

ALTER TABLE db_1702.test
  MODIFY COLUMN id INT;

ALTER TABLE db_1702.test
  DROP PRIMARY KEY;

ALTER TABLE db_1702.test
  ADD CONSTRAINT pk_test_id PRIMARY KEY (id);

ALTER TABLE db_1702.test
  MODIFY COLUMN id INT AUTO_INCREMENT;

SHOW FULL COLUMNS FROM db_1702.test;

ALTER TABLE db_1702.test
  CHANGE col new VARCHAR(255)
  FIRST;

ALTER TABLE db_1702.student_course
  DROP FOREIGN KEY fk_student_course_studentId;

ALTER TABLE db_1702.student_course
  ENABLE KEYS;

SELECT *
FROM db_1702.student_course;

