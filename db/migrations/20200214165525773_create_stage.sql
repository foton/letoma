-- +micrate Up
CREATE TABLE stages (
  id INTEGER NOT NULL PRIMARY KEY,
  tournament_id BIGINT,
  subleague_id BIGINT,
  kind VARCHAR,
  name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX stage_tournament_id_idx ON stages (tournament_id);
CREATE INDEX stage_subleague_id_idx ON stages (subleague_id);

-- +micrate Down
DROP TABLE IF EXISTS stages;
