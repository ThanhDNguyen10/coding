USE tnguy22;
CREATE TABLE OWNER
(OWNER_NUM CHAR(4) PRIMARY KEY,
LAST_NAME CHAR(50),
FIRST_NAME CHAR(20),
ADDRESS CHAR(15),
CITY CHAR(15),
STATE CHAR(2),
ZIP CHAR(5));
DESCRIBE OWNER;
THANH NGUYEN
DROP TABLE OWNER;



INSERT INTO OWNER (OWNER_NUM, LAST_NAME, FIRST_NAME, ADDRESS, CITY, STATE, ZIP)
VALUES
("AN75", "Anderson", "Bill", "18 Wilcox", "Glander Bay", "FL", "31044");
INSERT INTO OWNER (OWNER_NUM, LAST_NAME, FIRST_NAME, ADDRESS, CITY, STATE, ZIP)
VALUES
("EL25", "Elend", "Sandy and Bill", "462 Riverside", "Rivard", "FL", "31062");


SELECT*FROM OWNER;

