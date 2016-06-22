DROP TABLE pets;
DROP TABLE pet_shop;


CREATE TABLE pet_shop (
  id SERIAL4 primary key,
  name VARCHAR(255),
  address VARCHAR(255),
  stock_type VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL4 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  pet_shop_id INT4 references pet_shop(id)
);