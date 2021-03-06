USE tnguy22;
CREATE TABLE DEPARTMENT
(DEP_CODE CHAR(6) PRIMARY KEY,
DEP_LOCATION CHAR(40),
DEP_NAME CHAR(40),
DEP_TYPE CHAR(15));

DESC DEPARTMENT;

INSERT INTO DEPARTMENT
VALUES
('FC2223','Manassas, VA 20109','Costco Food Court','Food Court');
INSERT INTO DEPARTMENT
VALUES
('GS2110','Manassas, VA 20109','Costco Gasoline','Gas Station');
INSERT INTO DEPARTMENT
VALUES
('PH1283','Manassas, VA 20109','Costco Pharmacy','Pharmacy');

SELECT*FROM DEPARTMENT;

CREATE TABLE FOOD_COURT
(DEP_CODE CHAR(6),
FOOD_CODE CHAR(6),
FC_ITEMS CHAR(40),
FOREIGN KEY (DEP_CODE) REFERENCES DEPARTMENT (DEP_CODE),
PRIMARY KEY(DEP_CODE, FOOD_CODE));

DESC FOOD_COURT;

INSERT INTO FOOD_COURT
VALUES
('FC2223','123456','Drinks');
INSERT INTO FOOD_COURT
VALUES
('FC2223','111356','Meals');
INSERT INTO FOOD_COURT
VALUES
('FC2223','567523','Pizza');

SELECT*FROM FOOD_COURT;

CREATE TABLE GAS_STATION
(DEP_CODE CHAR(6),
GAS_CODE CHAR(6),
GAS_HOUR TIME,
FOREIGN KEY (DEP_CODE) REFERENCES DEPARTMENT (DEP_CODE),
PRIMARY KEY(DEP_CODE, GAS_CODE));

DESC GAS_STATION;

INSERT INTO GAS_STATION
VALUES
('GS2110','321312','09:30:00');
INSERT INTO GAS_STATION
VALUES
('GS2110','324812','09:30:00');
INSERT INTO GAS_STATION
VALUES
('GS2110','329823','09:30:00');

SELECT*FROM GAS_STATION;

CREATE TABLE PRODUCT_TYPE
(PROD_TYPE_CODE CHAR(6) PRIMARY KEY,
PROD_TYPE_DESC CHAR(60));

DESC PRODUCT_TYPE;

INSERT INTO PRODUCT_TYPE
VALUES
('PT2313','Chicken');
INSERT INTO PRODUCT_TYPE
VALUES
('PT3203','Beef');
INSERT INTO PRODUCT_TYPE
VALUES
('PT3783','Pork');
INSERT INTO PRODUCT_TYPE
VALUES
('PT9201','Drink');

SELECT*FROM PRODUCT_TYPE;

CREATE TABLE PRODUCT
(PROD_ID CHAR(6) PRIMARY KEY,
PROD_NAME CHAR(40),
PROD_ING CHAR(100),
PROD_PRICE DECIMAL(4,2),
DEP_CODE CHAR(6),
PROD_TYPE_CODE CHAR(6),
FOREIGN KEY (PROD_TYPE_CODE) REFERENCES PRODUCT_TYPE (PROD_TYPE_CODE),
FOREIGN KEY (DEP_CODE) REFERENCES FOOD_COURT (DEP_CODE));

DESC PRODUCT;

INSERT INTO PRODUCT
VALUES
('CH1298','Chicken Caesar Salad','Tomatoes, cheese, croutons, chicken, and lettuce','3.99','FC2223','PT2313');
INSERT INTO PRODUCT
VALUES
('PZ1298','Pepperoni Pizza','Pepperoni, Mozzarela Cheese, All-purpose Flour','9.99','FC2223','PT3783');
INSERT INTO PRODUCT
VALUES
('SW1298','BBQ Beef Brisket Sandwich','Beef Brisket, BBQ Sauce, Coleslaw','4.99','FC2223','PT3203');
INSERT INTO PRODUCT
VALUES
('FZ3841','Latte Mocha Freeze','Coffee, Milk, Vanilla, Chocolate','2.99','FC2223','PT9201');
INSERT INTO PRODUCT
VALUES
('SM1221','Fruit Smoothie','Fruit Puree, Berry Mix','2.99','FC2223','PT9201');
INSERT INTO PRODUCT
VALUES
('PE0129','Pepsi','Caffeine, Sugar, Corn Syrup','0.59','FC2223','PT9201');

select*from PRODUCT;

CREATE TABLE FOOD
(PROD_ID CHAR(6),
FOOD_NUM INT,
FOOD_CAL INT,
FOREIGN KEY (PROD_ID) REFERENCES PRODUCT (PROD_ID),
PRIMARY KEY (PROD_ID, FOOD_NUM));

DESC FOOD;

INSERT INTO FOOD
VALUES
('CH1298','5','650');
INSERT INTO FOOD
VALUES
('PZ1298','1','620');
INSERT INTO FOOD
VALUES
('SW1298','2','710');

SELECT*FROM FOOD;

CREATE TABLE BEVERAGES
(PROD_ID CHAR(6),
BEV_TYPE CHAR(20),
BEV_SIZE CHAR(6));

DESC BEVERAGES;

INSERT INTO BEVERAGES
VALUES
('FZ3841','Caffeinated','Medium');
INSERT INTO BEVERAGES
VALUES
('SM1221','Smoothie','Small');
INSERT INTO BEVERAGES
VALUES
('PE0129','Soda','Large');

SELECT*FROM BEVERAGES;


SELECT FOOD_CAL, PROD_NAME, (PROD_PRICE*5) AS 'TOTAL' FROM FOOD, PRODUCT WHERE PRODUCT.PROD_ID=FOOD.PROD_ID AND FOOD_CAL <700;

SELECT PROD_PRICE, PROD_TYPE_DESC, FOOD_NUM, (PROD_PRICE+0.07) AS 'TOTAL WITH TAX' FROM PRODUCT, PRODUCT_TYPE, FOOD 
WHERE PRODUCT_TYPE.PROD_TYPE_CODE = PRODUCT.PROD_TYPE_CODE AND FOOD.PROD_ID = PRODUCT.PROD_ID AND FOOD_NUM =5;


SELECT FOOD_CAL FROM FOOD WHERE PROD_ID = 'PZ1298';

SELECT PROD_NAME, PROD_PRICE FROM PRODUCT WHERE PROD_TYPE_CODE ='PT9201' GROUP BY PROD_NAME HAVING PROD_PRICE <5;



SELECT DEPARTMENT.DEP_CODE, PROD_NAME, FOOD_NUM FROM DEPARTMENT, PRODUCT, FOOD WHERE PRODUCT.DEP_CODE = DEPARTMENT.DEP_CODE AND PRODUCT.PROD_ID=FOOD.PROD_ID
AND (FOOD_NUM = 1 OR FOOD_NUM = 2 OR FOOD_NUM = 5);










