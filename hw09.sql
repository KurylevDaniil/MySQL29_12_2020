-- ������������ ������� �� ���� �����������, ����������, ��������������
-- 1 � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.
use sample; 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��� ����������',
  birthday_at date DEFAULT NULL COMMENT '���� ��������',
  created_at datetime DEFAULT current_timestamp(),
  updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
)

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;


-- 2 �������� �������������, ������� ������� �������� name �������� ������� �� ������� products � ��������������� �������� �������� name �� ������� catalogs.
use shop;
select products.name, catalogs.name from products 
	inner join catalogs on products.catalog_id = catalogs.id;

-- 3 (�� �������) ����� ������� ������� � ����������� ����� created_at. � ��� ��������� ���������� ����������� ������ �� ������ 2018 ���� '2018-08-01', '2016-08-04', '2018-08-16' � 2018-08-17. 
-- ��������� ������, ������� ������� ������ ������ ��� �� ������, ��������� � �������� ���� �������� 1, ���� ���� ������������ � �������� ������� � 0, ���� ��� �����������.

use shop;
DROP TABLE IF EXISTS datetbl2;
CREATE TABLE datetbl2 (
	created_at DATE
);

INSERT INTO datetbl2 VALUES
	('2018-08-01'), ('2018-08-02'), ('2018-08-03'), ('2018-08-04'), ('2018-08-05'), ('2018-08-06'), ('2018-08-07'),
	('2018-08-08'), ('2018-08-09'), ('2018-08-10'), ('2018-08-11'), ('2018-08-12'), ('2018-08-13'), ('2018-08-14'),
	('2018-08-15'), ('2018-08-16'), ('2018-08-17'), ('2018-08-18'), ('2018-08-19'), ('2018-08-20'), ('2018-08-21'),
	('2018-08-22'), ('2018-08-23'), ('2018-08-24'), ('2018-08-25'), ('2018-08-26'), ('2018-08-27'), ('2018-08-28'),
	('2018-08-29'), ('2018-08-30'), ('2018-08-31');

DROP TABLE IF EXISTS datetbl;
CREATE TABLE datetbl (
	created_at DATE
);

INSERT INTO datetbl VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17');


SELECT datetbl2.created_at, datetbl.created_at from datetbl2
left join datetbl on datetbl2.created_at = datetbl.created_at 


-- 4 (�� �������) ����� ������� ����� ������� � ����������� ����� created_at. �������� ������, ������� ������� ���������� ������ �� �������, �������� ������ 5 ����� ������ �������.
