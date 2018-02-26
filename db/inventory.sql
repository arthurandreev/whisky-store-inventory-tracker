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
  distillery_id INT8 REFERENCES distilleries(id) ON DELETE CASCADE,
  quantity INT4
);
