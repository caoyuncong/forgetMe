DROP TABLE IF EXISTS db_ip.city;
CREATE TABLE db_ip.city (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  city       VARCHAR(255) COMMENT '城市名',
  longitude VARCHAR(255) COMMENT '经度',
  latitude  VARCHAR(255) COMMENT '纬度',
  zoom      INT COMMENT '放大级别',
  count INT COMMENT 'IP 地址数量'
)
  COMMENT '城市表';

LOAD DATA LOCAL INFILE 'C:\\Users\\Administrator\\IdeaProjects\\forgetMe\\ipmap\\BaiduMap_cityCenter.txt'
INTO TABLE db_ip.city
FIELDS TERMINATED BY ',' (city, longitude, latitude, zoom)
SET id = NULL;

SELECT *
FROM db_ip.city;

SHOW TABLES IN db_ip;

DESC db_ip.city