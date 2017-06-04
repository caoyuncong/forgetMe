# 设计一个简单的在线电子词典数据库表结构，实现从英文查中文，从中文查英文功能
DROP DATABASE IF EXISTS db_2017dict;
CREATE DATABASE db_2017dict;

DROP TABLE IF EXISTS db_2017dict.english;
CREATE TABLE db_2017dict.english (
  id   INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  word VARCHAR(255) COMMENT '单词'
)
  COMMENT '英文表';

DROP TABLE IF EXISTS db_2017dict.chinese;
CREATE TABLE db_2017dict.chinese (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  definition VARCHAR(255) COMMENT '释义'
)
  COMMENT '中文表';

DROP TABLE IF EXISTS db_2017dict.english_chinese;
CREATE TABLE db_2017dict.english_chinese (
  englishId INT COMMENT '英文 ID FK',
  chineseId INT COMMENT '中文 ID FK',
  PRIMARY KEY (englishId, chineseId)
)
  COMMENT '英文中文关联表';

ALTER TABLE db_2017dict.english_chinese
  ADD CONSTRAINT
  english_chinese_fk_englishId
FOREIGN KEY (englishId)
REFERENCES db_2017dict.english (id);

ALTER TABLE db_2017dict.english_chinese
  ADD CONSTRAINT
  english_chinese_fk_chineseId
FOREIGN KEY (chineseId)
REFERENCES db_2017dict.chinese (id);

INSERT INTO db_2017dict.chinese VALUE (NULL, '苹果');
INSERT INTO db_2017dict.english VALUE (NULL, 'apple');
INSERT INTO db_2017dict.english VALUE (NULL, 'biffin');

INSERT INTO db_2017dict.english_chinese VALUE (1, 1);
INSERT INTO db_2017dict.english_chinese VALUE (2, 1);

SELECT c.definition
FROM db_2017dict.english e INNER JOIN db_2017dict.chinese c
  INNER JOIN db_2017dict.english_chinese ec
    ON c.id = ec.chineseId AND e.id = ec.englishId
WHERE e.word = 'apple';

SELECT e.word
FROM db_2017dict.english e INNER JOIN db_2017dict.chinese c
  INNER JOIN db_2017dict.english_chinese ec
    ON c.id = ec.chineseId AND e.id = ec.englishId
WHERE c.definition = '苹果';