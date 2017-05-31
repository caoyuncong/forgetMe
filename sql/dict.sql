# 设计一个简单的在线电子词典数据库表结构，实现从英文查中文，从中文查英文功能
DROP TABLE IF EXISTS db_1702.dict;
CREATE TABLE db_1702.dict (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  english VARCHAR(255) COMMENT '英文',
  chinese VARCHAR(255) COMMENT '中文'
)
  COMMENT '词典表';

# 在题 1 的基础上，实现查英文显示中文释义，及词性、音标、详细解释，例句的功能

