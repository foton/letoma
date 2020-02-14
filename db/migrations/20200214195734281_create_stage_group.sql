-- +micrate Up
CREATE TABLE stage_groups (
  id INTEGER NOT NULL PRIMARY KEY,
  stage_id BIGINT,
  name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX stage_group_stage_id_idx ON stage_groups (stage_id);

-- +micrate Down
DROP TABLE IF EXISTS stage_groups;
