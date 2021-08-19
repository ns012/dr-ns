# shell script for updating multple Query in database
#!/bin/sh
echo "This program will update and insert multiple string in database"

DATABASENAME=ABC

mysql -u root <<-ENDMARKER

use ABC;

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition; 

INSERT INTO <TABLENAME>(COLUMN_1, COLUMN_2,..)
VALUES (VALUE_1,VALUE_2,..)

commit;
ENDMARKER
