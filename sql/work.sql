# 实现一个工作日志系统的数据库表设计
# 注册时选择组别（第一组；第二组；第三组）以及员工或组长身份
# 员工登录可以发布当天的工作日志，并可以查看自己的所有日志
# 组长登录可以发布当天的工作日志，并可以查看本组的所有日志
# 组长可以按姓名和日期进行日志查询
DROP TABLE IF EXISTS db_1702.team;
CREATE TABLE db_1702.team (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title VARCHAR(255) NOT NULL
  COMMENT '组名称'
)
  COMMENT '组别表';

DROP TABLE IF EXISTS db_1702.user;
CREATE TABLE db_1702.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name     VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  teamId   INT          NOT NULL
  COMMENT 'FK',
  type     INT          NOT NULL
  COMMENT '0: 组员；1：组长'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_1702.journal;
CREATE TABLE db_1702.journal (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  journal TEXT NOT NULL
  COMMENT '日志',
  date    DATE
  COMMENT '日期',
  userId  INT COMMENT 'FK'
)
  COMMENT '日志表';

ALTER TABLE db_1702.journal
  ADD CONSTRAINT
  journal_fk_userId
FOREIGN KEY (userId)
REFERENCES db_1702.user (id);

ALTER TABLE db_1702.user
  ADD CONSTRAINT
  user_fk_teamId
FOREIGN KEY (teamId)
REFERENCES db_1702.team (id);

SHOW TABLE STATUS IN db_1702;

INSERT INTO db_1702.team VALUE (NULL, 1);
INSERT INTO db_1702.team VALUE (NULL, 2);
INSERT INTO db_1702.team VALUE (NULL, 3);

INSERT INTO db_1702.user VALUE (NULL, 'Jerry', '123', 1, 0);
INSERT INTO db_1702.user VALUE (NULL, 'Je', '123', 1, 0);
INSERT INTO db_1702.user VALUE (NULL, 'Tom', '123', 2, 0);
INSERT INTO db_1702.user VALUE (NULL, 'Kim', '123', 3, 0);
INSERT INTO db_1702.user VALUE (NULL, 'Kim1', '123', 1, 1);
INSERT INTO db_1702.user VALUE (NULL, 'Kim2', '123', 2, 1);
INSERT INTO db_1702.user VALUE (NULL, 'Kim3', '123', 3, 1);

INSERT INTO db_1702.journal VALUE (NULL, 'Where there is a will ,there is a way!', '2017-5-31', 1);
INSERT INTO db_1702.journal VALUE (NULL, 'Where there is a will ,there is a way!', curdate(), 1);
INSERT INTO db_1702.journal VALUE (NULL, 'Where there is a will ,there is a way!', '2017-6-1', 1);
INSERT INTO db_1702.journal VALUE (NULL, 'Never put off until tomorrow what may be done today', '2017-5-31', 2);
INSERT INTO db_1702.journal VALUE (NULL, 'Details is the key to success', '2017-5-31', 3);
INSERT INTO db_1702.journal VALUE (NULL, 'Hope for the best,prepare for the worst', '2017-5-31', 4);
INSERT INTO db_1702.journal VALUE (NULL, 'No cross, no crown。', '2017-5-31', 5);
INSERT INTO db_1702.journal
  VALUE (NULL, 'My journey is long and winding, I will keep on exploring my way far and wide', '2017-5-31', 6);


SELECT *
FROM db_1702.team;

-- 组员查询日志
SELECT
  journal,
  date
FROM db_1702.journal
WHERE journal.userId = 1;

-- 组长查询日志
SELECT
  u.name,
  j.journal,
  j.date
FROM db_1702.user u LEFT JOIN db_1702.journal j
    ON u.id = j.userId
WHERE u.teamId = 1;

-- 组员按条件查询日志
SELECT
  u.name,
  j.journal,
  j.date
FROM db_1702.user u LEFT JOIN db_1702.journal j
    ON u.id = j.userId
WHERE u.teamId = 1 AND u.name = 'Je';

SELECT
  u.name,
  j.journal,
  j.date
FROM db_1702.user u INNER JOIN db_1702.journal j
    ON u.id = j.userId
WHERE u.teamId = 1 AND j.date = '2017-5-31';

SELECT
  u.name,
  j.journal,
  j.date
FROM db_1702.user u INNER JOIN db_1702.journal j
    ON u.id = j.userId
WHERE u.teamId = 1 AND (j.date = '2017-6-1' AND u.name = 'Je');

