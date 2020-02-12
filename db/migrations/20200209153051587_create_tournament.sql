-- +micrate Up
CREATE TABLE tournaments (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR,
  start_date DATE,
  end_date DATE,
  league_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX tournament_league_id_idx ON tournaments (league_id);

-- +micrate Down
DROP TABLE IF EXISTS tournaments;
