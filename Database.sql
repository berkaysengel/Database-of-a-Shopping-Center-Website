/*DROP TABLE category CASCADE constraints;
DROP TABLE order_sale CASCADE constraints;
DROP TABLE ordered_product CASCADE constraints;
DROP TABLE newUser CASCADE constraints;
DROP TABLE newOrder CASCADE constraints;
DROP TABLE product CASCADE constraints;
DROP TABLE sale CASCADE constraints;
DROP TABLE shop CASCADE constraints;
DROP TABLE shop_category CASCADE constraints;
DROP TABLE shop_product CASCADE constraints;*/

CREATE TABLE newUser (
user_id number(9) primary key,
first_name varchar2(100) not null,
last_name varchar2(100) not null,
email varchar2(100) not null,
password varchar2(20) not null,
address varchar2(255) not null,
phone_number number(15) not null,
created_at date not null
);

CREATE TABLE category (
category_id number(2) primary key,
category_name varchar2(20) not null
);

CREATE TABLE shop (
shop_id number(3) primary key,
shop_name varchar2(30) not null,
floor number(1) not null
);

CREATE TABLE product (
product_id number(10) primary key,
product_name varchar2(20) not null,
price number(7) not null
);

CREATE TABLE sale (
sale_id number(20) primary key,
sale_amount number(7) not null,
finishes_at date not null
);

CREATE TABLE newOrder (
order_id number(10) primary key,
user_id number(9) references newUser(user_id),
shipping_address varchar2(255) not null,
shipping_date varchar2(255) not null,
shipping_status varchar2(255) not null,
created_at date not null
);

CREATE TABLE ordered_product (
order_id number(10) references newOrder(order_id),
product_id number(10) references product(product_id),
amount number(3) not null
);

CREATE TABLE shop_product (
shop_id number(3) references shop(shop_id),
product_id number(10) references product(product_id),
quantity number(5) not null
);

CREATE TABLE shop_category (
category_id number(2) references category(category_id),
shop_id number(3) references shop(shop_id)
);

CREATE TABLE order_sale (
order_id number(10) references newOrder(order_id),
sale_id number(20) references sale(sale_id)
);

INSERT INTO newUser VALUES (154876, 'Batuhan', 'Özcan', 'batuhan.fb_@outlook.com', 'batuhan2001', 'tatlıkuyu mahallesi, körfez caddesi, 1303/4 sokak, no 11, daire 4, Gebze, KOCAELİ', 05060238141, TO_DATE('06/06/2022', 'mm/dd/yyyy'));
INSERT INTO newUser VALUES (154877, 'Bahadır', 'Arslan', 'bahadır.fb_@outlook.com', 'bahadır2000', 'tatlısemt mahallesi, dere caddesi, 1341/5 sokak, no 7, daire 2, Altınordu, ORDU', 05374193162, TO_DATE('06/07/2022', 'mm/dd/yyyy'));
INSERT INTO newUser VALUES (154878, 'Berkay', 'Şengel', 'berkay.fb_@outlook.com', 'berkay2000', 'gülsuyu mahallesi, atatürk caddesi, 1354/7 sokak, no 9, daire 5, Keşan, EDİRNE', 05498643547, TO_DATE('06/08/2022', 'mm/dd/yyyy'));
INSERT INTO newOrder VALUES (111, 154876, 'tatlıkuyu mahallesi, körfez caddesi, 1303/4 sokak, no 11, daire 4, Gebze, KOCAELİ', TO_DATE('06/22/2022', 'mm/dd/yyyy'), 'Processing', TO_DATE('06/06/2022', 'mm/dd/yyyy'));
INSERT INTO newOrder VALUES (112, 154877, 'tatlısemt mahallesi, dere caddesi, 1341/5 sokak, no 7, daire 2, Altınordu, ORDU', TO_DATE('06/23/2022', 'mm/dd/yyyy'), 'Processing', TO_DATE('06/07/2022', 'mm/dd/yyyy'));
INSERT INTO newOrder VALUES (113, 154878, 'gülsuyu mahallesi, atatürk caddesi, 1354/7 sokak, no 9, daire 5, Keşan, EDİRNE', TO_DATE('06/24/2022', 'mm/dd/yyyy'), 'Processing', TO_DATE('06/08/2022', 'mm/dd/yyyy'));
INSERT INTO newOrder VALUES (114, 154876, 'tatlıkuyu mahallesi, körfez caddesi, 1303/4 sokak, no 11, daire 4, Gebze, KOCAELİ', TO_DATE('06/25/2022', 'mm/dd/yyyy'), 'Pending', TO_DATE('06/06/2022', 'mm/dd/yyyy'));
INSERT INTO product VALUES (1845261, 'T-shirt', 50);
INSERT INTO product VALUES (1325982, 'Shoe', 120);
INSERT INTO product VALUES (1785496, 'Keyboard', 100);
INSERT INTO product VALUES (1000001, 'Lahmacun', 12);
INSERT INTO product VALUES (1000002, 'Pide', 49);
INSERT INTO product VALUES (1000003, 'Burger', 60);
INSERT INTO product VALUES (1000004, 'Et Doner', 49);
INSERT INTO product VALUES (1000005, 'Kuru Fasulye-Pilav', 31);
INSERT INTO product VALUES (1000006, 'Pizza', 52);
INSERT INTO product VALUES (1000007, 'Tavuk Durum', 35);
INSERT INTO product VALUES (2000001, 'Boot', 900);
INSERT INTO product VALUES (2000002, 'Jacket', 1300);
INSERT INTO shop VALUES (5, 'Mediamarkt', 1);
INSERT INTO shop VALUES (7, 'Defacto', 1);
INSERT INTO shop VALUES (12,'Nike', 2);
INSERT INTO shop VALUES (13,'Adidas', 2);
INSERT INTO shop VALUES (14,'Decathlon', 2);
INSERT INTO shop VALUES (15,'Goal', 2);
INSERT INTO shop VALUES (16,'Gratis', 2);
INSERT INTO shop VALUES (18,'Gurme', 2);
INSERT INTO shop VALUES (19,'Greyder', 3);
INSERT INTO shop VALUES (20,'Pasa Doner', 3);
INSERT INTO category VALUES (3, 'Technology');
INSERT INTO category VALUES (4, 'Cosmetics');
INSERT INTO category VALUES (5, 'Entertainment');
INSERT INTO category VALUES (6, 'Clothing');
INSERT INTO category VALUES (7, 'Sport');
INSERT INTO category VALUES (8, 'Food');
INSERT INTO sale VALUES (123, '20', TO_DATE('06/30/2022', 'mm/dd/yyyy'));
INSERT INTO sale VALUES (124, '50', TO_DATE('06/30/2022', 'mm/dd/yyyy'));
INSERT INTO sale VALUES (125, '100', TO_DATE('06/30/2022', 'mm/dd/yyyy'));
INSERT INTO sale VALUES (126, '10', TO_DATE('06/30/2022', 'mm/dd/yyyy'));
INSERT INTO ordered_product VALUES (111, 1845261, 6);
INSERT INTO ordered_product VALUES (112, 1785496, 2);
INSERT INTO ordered_product VALUES (113, 1325982, 1);
INSERT INTO ordered_product VALUES (114, 1325982, 1);
INSERT INTO shop_product VALUES (5, 1785496, 6);
INSERT INTO shop_product VALUES (7, 1845261, 100);
INSERT INTO shop_product VALUES (12, 1325982, 20);
INSERT INTO shop_product VALUES (18, 1000001, 200);
INSERT INTO shop_product VALUES (18, 1000002, 150);
INSERT INTO shop_product VALUES (18, 1000003, 500);
INSERT INTO shop_product VALUES (18, 1000006, 300);
INSERT INTO shop_product VALUES (19, 2000001, 30);
INSERT INTO shop_product VALUES (19, 2000002, 30);
INSERT INTO shop_product VALUES (20, 1000004, 250);
INSERT INTO shop_product VALUES (20, 1000005, 1000);
INSERT INTO shop_product VALUES (20, 1000007, 2000);
INSERT INTO shop_category VALUES (3, 5);
INSERT INTO shop_category VALUES (4, 16);
INSERT INTO shop_category VALUES (6, 7);
INSERT INTO shop_category VALUES (6, 19);
INSERT INTO shop_category VALUES (7, 12);
INSERT INTO shop_category VALUES (7, 13);
INSERT INTO shop_category VALUES (7, 14);
INSERT INTO shop_category VALUES (7, 15);
INSERT INTO shop_category VALUES (8, 18);
INSERT INTO shop_category VALUES (8, 20);
INSERT INTO order_sale VALUES (111, 124);
INSERT INTO order_sale VALUES (112, 123);
INSERT INTO order_sale VALUES (112, 126);
INSERT INTO order_sale VALUES (113, 125);