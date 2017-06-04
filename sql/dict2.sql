# 实现查英文显示简明释义，及词性、音标、详尽释义，例句的功能

DROP DATABASE IF EXISTS db_2017dict;
CREATE DATABASE db_2017dict;

DROP TABLE IF EXISTS db_2017dict.word;
CREATE TABLE db_2017dict.word (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  english    VARCHAR(255) NOT NULL
  COMMENT '英文',
  phoneticUk VARCHAR(255) COMMENT '英语音标',
  phoneticUs VARCHAR(255) COMMENT '美语音标'
)
  COMMENT '单词表';

DROP TABLE IF EXISTS db_2017dict.part_of_speech;
CREATE TABLE db_2017dict.part_of_speech (
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  partOfSpeech VARCHAR(255) COMMENT '词性',
  wordId       INT COMMENT '单词 ID FK'
)
  COMMENT '词性表';

DROP TABLE IF EXISTS db_2017dict.concise;
CREATE TABLE db_2017dict.concise (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  conciseChinese VARCHAR(255) COMMENT '简明释义',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '简明释义表';

DROP TABLE IF EXISTS db_2017dict.detail;
CREATE TABLE db_2017dict.detail (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  detailChinese  VARCHAR(255) COMMENT '详尽释义',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '详尽释义表';

DROP TABLE IF EXISTS db_2017dict.sentence;
CREATE TABLE db_2017dict.sentence (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  english        TEXT COMMENT '英语',
  chinese        TEXT COMMENT '中文',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '例句表';

ALTER TABLE db_2017dict.part_of_speech
  ADD CONSTRAINT
  part_of_speech_fk_wordId
FOREIGN KEY (wordId)
REFERENCES db_2017dict.word (id);

ALTER TABLE db_2017dict.concise
  ADD CONSTRAINT
  concise_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_2017dict.part_of_speech (id);

ALTER TABLE db_2017dict.detail
  ADD CONSTRAINT
  detail_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_2017dict.part_of_speech (id);

ALTER TABLE db_2017dict.sentence
  ADD CONSTRAINT
  sentence_fk_partOfSpeech
FOREIGN KEY (partOfSpeechId)
REFERENCES db_2017dict.part_of_speech (id);

INSERT INTO db_2017dict.word VALUE (NULL, 'test', '[test]', '[test]');

INSERT