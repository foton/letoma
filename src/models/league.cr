class League < Granite::Base
  connection sqlite
  table leagues

  has_many :subleagues # league for players category
  has_many :tournaments


  column id : Int64, primary: true
  column name : String = ""

  validate_min_length :name, 3

  def to_s
    name.to_s
  end
end
