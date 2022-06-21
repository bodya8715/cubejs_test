CREATE DATABASE IF NOT EXISTS "cubejs_test_db";

CREATE TABLE "users" (
    id serial PRIMARY KEY,
    first_name varchar(64) NOT NULL CHECK(first_name != '' ),
    last_name varchar(64) NOT NULL CHECK(last_name != ''),
    email varchar(256) NOT NULL UNIQUE CHECK(email != ''),
    is_male boolean,
    life_time double precision,
    "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
    "updatedAt" timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO "users" (first_name, last_name, email, is_male)
VALUES 
('A', 'B', 'AB@gmail.com', 'true'),
('C', 'D', 'CD@gmail.com', 'false'),
('E', 'F', 'EF@gmail.com', 'true'),
('E', 'N', 'EN@gmail.com', 'false'),
('K', 'P', 'KP@gmail.com', 'true');

INSERT INTO "users" (first_name, last_name, email, is_male, life_time)
VALUES 
('Z', 'P', 'ZP@gmail.com', 'true', 250.12),
('D', 'D', 'DD@gmail.com', 'false', 4882.12);

INSERT INTO "users" (first_name, last_name, email, is_male, life_time)
VALUES 
('A', 'A', 'AA@gmail.com', 'true', 25.12);

INSERT INTO "users" (first_name, last_name, email, is_male, life_time)
VALUES 
('AA', 'AA', 'AAAA@gmail.com', 'true', 45.12);

CREATE TABLE "orders" (
  id serial PRIMARY KEY,
  "userId" int REFERENCES "users",
  total money NOT NULL,
  "createdAt" timestamp NOT NULL DEFAULT current_timestamp,
  "updatedAt" timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO "orders" ("userId", total)
VALUES 
(1, 867846.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(1, 5635.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(1, 2345345.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(1, 45635.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(2, 56435.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(2, 573687.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(3, 12345.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(3, 81746.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(3, 48634.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(3, 6946.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(3, 757356.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(4, 754235.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(4, 6978356.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(5, 69438356.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(6, 1876.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(7, 34356.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(6, 1876.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(7, 34356.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(8, 1256.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(9, 1356.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(9, 8956.02);

INSERT INTO "orders" ("userId", total)
VALUES 
(9, 896856.02);


SELECT * FROM users JOIN orders ON users.id = orders."userId";

SELECT * FROM users JOIN (SELECT "userId", max("updatedAt") AS "last_order" FROM orders GROUP BY "userId") AS "last_orders" ON users.id = "last_orders"."userId";

SELECT * FROM users WHERE life_time >= 10;

SELECT "userId", max("updatedAt") AS "Last order" FROM orders GROUP BY "userId";

SELECT "users_id".* ,"last_orders"."last_order" FROM (SELECT * FROM users WHERE life_time >= 10) AS "users_id" JOIN (SELECT "userId", max("updatedAt") AS "last_order" FROM orders GROUP BY "userId") AS "last_orders" ON "users_id".id = "last_orders"."userId";

