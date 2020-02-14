-- +micrate Up
CREATE TABLE subleagues (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR,
  league_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX subleague_league_id_idx ON subleagues (league_id);

-- +micrate Down
DROP TABLE IF EXISTS subleagues;
