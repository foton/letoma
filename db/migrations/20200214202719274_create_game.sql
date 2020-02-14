-- +micrate Up
CREATE TABLE games (
  id INTEGER NOT NULL PRIMARY KEY,
  stage_group_id BIGINT,
  left_side_id BIGINT,
  right_side_id BIGINT,
  left_score INT,
  right_score INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX game_stage_group_id_idx ON games (stage_group_id);
CREATE INDEX game_left_side_id_idx ON games (left_side_id);
CREATE INDEX game_right_side_id_idx ON games (right_side_id);

-- +micrate Down
DROP TABLE IF EXISTS games;
