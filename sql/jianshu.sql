# 核心功能
/*
1. 用户
2. 文集
3. 文章
4. 评论
5. 关注
6. 专题
7. 收藏
8. 打赏
*/

DROP DATABASE IF EXISTS db_jianshu;
CREATE DATABASE db_jianshu;

# 1. 用户 user
DROP TABLE IF EXISTS db_jianshu.user;
CREATE TABLE db_jianshu.user (
  id       INT                                AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  nick     VARCHAR(15) UNIQUE NOT NULL
  COMMENT '昵称',
  mobile   VARCHAR(255) UNIQUE
  COMMENT '手机号',
  password VARCHAR(255)       NOT NULL
  COMMENT '密码',
  avatar   VARCHAR(255)       NOT NULL        DEFAULT 'default_avatar.png'
  COMMENT '头像',
  pay      INT COMMENT '打赏金额，默认-2元；NULL-关闭打赏' DEFAULT 2,
  money    DECIMAL(8, 2)      NOT NULL        DEFAULT 0
  COMMENT '账户余额'
)
  COMMENT '用户表';

# 2. 文集 notebook
DROP TABLE IF EXISTS db_jianshu.notebook;
CREATE TABLE db_jianshu.notebook (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) NOT NULL
  COMMENT '文集名',
  userId INT COMMENT 'FK 用户 ID'
)
  COMMENT '文集表';

# 3. 文章 note
DROP TABLE IF EXISTS db_jianshu.note;
CREATE TABLE db_jianshu.note (
  id         INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title      VARCHAR(255) NOT NULL
  COMMENT '标题',
  content    TEXT         NOT NULL
  COMMENT '内容',
  time       DATETIME DEFAULT now()
  COMMENT '时间',
  views      INT      DEFAULT 0
  COMMENT '阅读次数',
  notebookId INT COMMENT 'FK 文集 ID'
)
  COMMENT '文章表';

# like table: id userId noteId

# 4. 评论 comment
DROP TABLE IF EXISTS db_jianshu.comment;
CREATE TABLE db_jianshu.comment (
  id        INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content   TEXT NOT NULL
  COMMENT '内容',
  time      DATETIME DEFAULT now()
  COMMENT '时间',
  noteId    INT COMMENT 'FK 文章 ID ',
  userId    INT COMMENT 'FK 用户 ID ',
  commentId INT COMMENT 'FK 评论 ID '
)
  COMMENT '评论表';

# zan table: id userId commentId time

# 5. 专题 collection
DROP TABLE IF EXISTS db_jianshu.collection;
CREATE TABLE db_jianshu.collection (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  title  VARCHAR(255) NOT NULL
  COMMENT '名称',
  userId INT COMMENT 'FK 用户 ID'
)
  COMMENT '专题表';

# 6. 专题-文章 collection_note
DROP TABLE IF EXISTS db_jianshu.collection_note;
CREATE TABLE db_jianshu.collection_note (
  collectionId INT COMMENT 'PK FK',
  noteId       INT COMMENT 'PK FK',
  PRIMARY KEY (collectionId, noteId)
)
  COMMENT '专题-文章表';

# 7. 关注 follow
DROP TABLE IF EXISTS db_jianshu.follow;
CREATE TABLE db_jianshu.follow (
  id                   INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  time                 DATETIME NOT NULL DEFAULT now()
  COMMENT '时间',
  userId               INT COMMENT 'FK 关注者 ID',
  followedUserId       INT COMMENT 'FK 被关注用户 ID',
  followedNotebookId   INT COMMENT 'FK 被关注文集 ID',
  followedCollectionId INT COMMENT 'FK 被关注专题 ID'
)
  COMMENT '关注表';

# 8. 收藏 bookmark
DROP TABLE IF EXISTS db_jianshu.bookmark;
CREATE TABLE db_jianshu.bookmark (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  userId INT COMMENT 'FK 收藏者 ID',
  noteId INT COMMENT 'FK 被收藏文章 ID'
)
  COMMENT '收藏表';

# 9. 打赏 pay
DROP TABLE IF EXISTS db_jianshu.pay;
CREATE TABLE db_jianshu.pay (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  amount  INT          NOT NULL
  COMMENT '金额',
  message VARCHAR(255) COMMENT '留言',
  method  VARCHAR(255) NOT NULL
  COMMENT '支付方式',
  userId  INT COMMENT 'FK 打赏用户 ID',
  noteId  INT COMMENT 'FK 文章 ID'
)
  COMMENT '打赏表';

# 外键
-- notebook 文集
ALTER TABLE db_jianshu.notebook
  ADD CONSTRAINT
  notebook_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

-- note 文章
ALTER TABLE db_jianshu.note
  ADD CONSTRAINT
  note_fk_notebookId
FOREIGN KEY (notebookId)
REFERENCES db_jianshu.notebook (id);

-- comment 评论
ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note (id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_jianshu.comment (id);

-- collection 专题
ALTER TABLE db_jianshu.collection
  ADD CONSTRAINT
  collection_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

-- collection_note 专题-文章
ALTER TABLE db_jianshu.collection_note
  ADD CONSTRAINT
  collection_note_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note (id);

ALTER TABLE db_jianshu.collection_note
  ADD CONSTRAINT
  collection_note_fk_collectionId
FOREIGN KEY (collectionId)
REFERENCES db_jianshu.collection (id);

-- follow 关注
ALTER TABLE db_jianshu.follow
  ADD CONSTRAINT
  follow_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

ALTER TABLE db_jianshu.follow
  ADD CONSTRAINT
  follow_fk_followedUserId
FOREIGN KEY (followedUserId)
REFERENCES db_jianshu.user (id);

ALTER TABLE db_jianshu.follow
  ADD CONSTRAINT
  follow_fk_followedNotebookId
FOREIGN KEY (followedNotebookId)
REFERENCES db_jianshu.notebook (id);

ALTER TABLE db_jianshu.follow
  ADD CONSTRAINT
  follow_fk_followedCollectionId
FOREIGN KEY (followedCollectionId)
REFERENCES db_jianshu.collection (id);

-- bookmark 收藏
ALTER TABLE db_jianshu.bookmark
  ADD CONSTRAINT
  bookmark_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

ALTER TABLE db_jianshu.bookmark
  ADD CONSTRAINT
  bookmark_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note (id);

-- pay 打赏
ALTER TABLE db_jianshu.pay
  ADD CONSTRAINT
  pay_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

ALTER TABLE db_jianshu.pay
  ADD CONSTRAINT
  pay_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note (id);

-- 样本数据
INSERT INTO db_jianshu.user (nick, mobile, password) VALUE ('Tom', '123', 'abc'); -- 1
INSERT INTO db_jianshu.user (nick, mobile, password) VALUE ('Jerry', '456', 'abc'); -- 2

INSERT INTO db_jianshu.notebook VALUE (NULL, 'Tom notebook', 1); -- 1
INSERT INTO db_jianshu.notebook VALUE (NULL, 'Jerry notebook', 2); -- 2

INSERT INTO db_jianshu.note (title, content, notebookId) VALUE ('Tom title', 'Tom note content', 1); -- 1

INSERT INTO db_jianshu.comment VALUE (NULL, 'Jerry COMMENT', '2017-6-4 16:45:00', 1, 2, NULL); -- 1
INSERT INTO db_jianshu.comment VALUE (NULL, 'Jerry COMMENT', '2017-6-4 16:48:00', 1, 2, 1); -- 2

INSERT INTO db_jianshu.follow (userId, followedUserId) VALUE (2, 1);
INSERT INTO db_jianshu.bookmark VALUE (NULL, 2, 1);

-- select
SELECT *
FROM db_jianshu.user;

SELECT *
FROM db_jianshu.notebook;

SELECT *
FROM db_jianshu.note;

SELECT *
FROM db_jianshu.comment;

SELECT *
FROM db_jianshu.follow;

SELECT count(*)
FROM db_jianshu.follow
WHERE followedUserId = 1;

SELECT *
FROM db_jianshu.bookmark;

SELECT
  u.avatar,
  u.nick,
  n.title,
  n.content,
  n.time,
  n.views,
  count(*) AS 评论次数 -- ****
FROM db_jianshu.bookmark b INNER JOIN db_jianshu.note n
  INNER JOIN db_jianshu.notebook nb
  INNER JOIN db_jianshu.user u
  INNER JOIN db_jianshu.comment c
    ON b.noteId = n.id AND n.notebookId = nb.id AND nb.userId = u.id AND n.id = c.noteId
WHERE n.id = 1;
/*
<img src="default_avatar.png">
 */

-- note id 1
SELECT count(*)
FROM db_jianshu.note n INNER JOIN db_jianshu.comment c
    ON n.id = c.noteId
WHERE n.id = 1;

SELECT *
FROM db_jianshu.user;

START TRANSACTION ;

# 1.
INSERT INTO db_jianshu.pay VALUE (NULL, 2, 'message...', 'wechat', 2, 1);
# 2.
UPDATE db_jianshu.user
SET money = money + 2
WHERE id = 1;

COMMIT ;
