-- +micrate Up
CREATE TABLE players (
  id INTEGER NOT NULL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  appendix VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS players;
