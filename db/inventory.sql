DROP TABLE bottles;
DROP TABLE distilleries;

CREATE TABLE distilleries (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE bottles (
  id SERIAL8 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  distillery_id INT8 REFERENCES distilleries(id)
);

-- CREATE TABLE stock (
--   id SERIAL8 primary key,
--   bottle_id INT8 REFERENCES bottles(id),
--   quantity INT4
-- );
