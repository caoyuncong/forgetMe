DROP TABLE IF EXISTS db_1702.csdn;
CREATE TABLE db_1702.csdn (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  username VARCHAR(255) COMMENT '用户名',
  password VARCHAR(255) COMMENT '密码',
  email    VARCHAR(255) COMMENT '邮箱'
)
  COMMENT 'CSDN 用户名';

SELECT count(*)
FROM db_1702.csdn;

SHOW DATABASES;

LOAD DATA LOCAL INFILE 'e:/CSDN-6million/www.csdn.net.sql'
INTO TABLE db_1702.csdn
FIELDS TERMINATED BY ' # ' (username, password, email)
SET id = NULL;

-- 查询练习题----------
# 各列值的快速模糊查询
SELECT *
FROM db_1702.csdn
WHERE username LIKE '%tester%';
SELECT *
FROM db_1702.csdn
WHERE password LIKE '%123%';
SELECT *
FROM db_1702.csdn
WHERE email LIKE '%test@qq.com%';

# 排名前十的密码
SELECT password
FROM db_1702.csdn
GROUP BY password
ORDER BY count(password) DESC
LIMIT 10 OFFSET 0;
# 排名前十的邮箱
SELECT substr(email, locate('@', email) + 1) -- subString() indexOf()
FROM db_1702.csdn
GROUP BY substr(email, locate('@', email) + 1)
ORDER BY count(substr(email, locate('@', email) + 1)) DESC
LIMIT 10;

# 用户名和邮箱名相同的数据
SELECT *
FROM db_1702.csdn
WHERE username = substr(email, 1, locate('@', email) - 1);

# 密码可能是生日的数据 -- 378775
SELECT count(*)
FROM db_1702.csdn
WHERE password REGEXP '^19[0-9]{2}0[1-9]{1}[0-3]{1}[0-9]{1}$' -- 235782
UNION
SELECT count(*)
FROM db_1702.csdn
WHERE password REGEXP '^19[0-9]{2}1[0-2]{1}[0-3]{1}[0-9]{1}$'; -- 142993

# 7.哪一年出生的用户最多
CREATE OR REPLACE VIEW db_1702.v_password
AS
  SELECT password
  FROM db_1702.csdn
  WHERE password REGEXP '^19[0-9]{2}0[1-9]{1}[0-3]{1}[0-9]{1}$'
  UNION ALL
  SELECT password
  FROM db_1702.csdn
  WHERE password REGEXP '^19[0-9]{2}1[0-2]{1}[0-3]{1}[0-9]{1}$';

SELECT
  substr(password, 1, 4),
  count(*)
FROM db_1702.v_password
GROUP BY 1
ORDER BY 2 DESC;

# 8.哪个星座的用户最多 --  ?

# 密码是 QQ 号的
SELECT *
FROM db_1702.csdn
WHERE email REGEXP '@qq.com' AND trim(password) = replace(email, '@qq.com', '');

# 密码是手机号的
# 哪个运营商的用户最多

# 弱密码用户数据
# 短密码
SELECT password
FROM db_1702.csdn
WHERE length(password) < 5;
# 纯数字密码
SELECT password
FROM db_1702.csdn
WHERE password REGEXP '^[0-9]+$';

# 纯字母密码
SELECT *
FROM db_1702.csdn
WHERE password REGEXP '^[a-zA-Z]+$';
# 强密码用户数据
# 长密码
SELECT password
FROM db_1702.csdn
WHERE length(password) > 8;
# 字母和数字
SELECT password
FROM db_1702.csdn
WHERE password REGEXP '^[a-zA-Z0-9]+$';
# 含特殊符号
SELECT *
FROM db_1702.csdn
WHERE password REGEXP '^[a-zA-Z0-9!@#$%^&*()_+]+$';