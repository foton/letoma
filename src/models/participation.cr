class Participation < Granite::Base
  connection sqlite
  table participations

  belongs_to :tournament

  belongs_to :subleague

  belongs_to :player

  column id : Int64, primary: true
end
