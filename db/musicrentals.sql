DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS stocklist;

CREATE TABLE customers
( id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  phone VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE stocklist
(
  id SERIAL8 PRIMARY KEY,
  item_name VARCHAR(255) not null,
  item_category VARCHAR(255) not null,
  price INT4,
  quantity INT4

);

CREATE TABLE rentals
(
  id SERIAL8 PRIMARY KEY,
  rental_name VARCHAR(255),
  price INT4,
  rental_date VARCHAR(255),
  customer_id INT4 references customers(id) ON DELETE CASCADE,
  stock_id INT4 references stocklist(id) ON DELETE CASCADE
);
