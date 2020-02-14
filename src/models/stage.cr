

class Stage < Granite::Base
  KINDS = [
    "RoundRobin", # base
    "SingleElimination" # playoff
  ]
  connection sqlite
  table stages

  belongs_to :tournament
  belongs_to :subleague

  column id : Int64, primary: true
  column kind : String = ""
  column name : String = ""
end
