-- +micrate Up
CREATE TABLE participations (
  id INTEGER NOT NULL PRIMARY KEY,
  tournament_id BIGINT,
  subleague_id BIGINT,
  player_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX participation_tournament_id_idx ON participations (tournament_id);
CREATE INDEX participation_subleague_id_idx ON participations (subleague_id);
CREATE INDEX participation_player_id_idx ON participations (player_id);

-- +micrate Down
DROP TABLE IF EXISTS participations;
