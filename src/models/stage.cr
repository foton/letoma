

class Stage < Granite::Base
  KINDS = [
    "RoundRobin", # base
    "SingleElimination" # playoff
  ]
  connection sqlite
  table stages

  belongs_to :tournament
  belongs_to :subleague
  has_many stage_groups, class_name: StageGroup

  column id : Int64, primary: true
  column kind : String = ""
  column name : String = ""

  def medium_name
    "#{subleague.name} :: #{name}"
  end

  def full_name
    "#{tournament.name} :: #{medium_name}"
  end
end
