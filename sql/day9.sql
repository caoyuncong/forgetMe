CREATE USER over@'localhost'
  IDENTIFIED BY '123456';

RENAME USER over@'localhost' TO over_too@'localhost';

SELECT *
FROM mysql.user;

SET PASSWORD = PASSWORD ('789456');
SET PASSWORD = PASSWORD ('system');

UPDATE mysql.user
SET password = password('system')
WHERE user = 'root';

GRANT CREATE ON scott.* TO over_too@'localhost';
GRANT SELECT ON scott.* TO over_too@'localhost';


SHOW GRANTS FOR over_too@'localhost';




