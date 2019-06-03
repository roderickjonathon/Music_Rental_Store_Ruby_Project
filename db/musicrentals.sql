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
  item_name VARCHAR(255),
  item_category VARCHAR(255),
  price INT4,
  quantity INT4

);

CREATE TABLE rentals
(
  id SERIAL8 PRIMARY KEY,
  rental_reference VARCHAR(255),
  rental_items VARCHAR(255),
  rental_price INT4,
  rental_date DATE,
  customer_id INT4 references customers(id) ON DELETE CASCADE,
  stock_id INT4 references stocklist(id) ON DELETE CASCADE
);
