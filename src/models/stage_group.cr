class StageGroup < Granite::Base
  connection sqlite
  table stage_groups

  belongs_to :stage

  column id : Int64, primary: true
  column name : String=""
end
