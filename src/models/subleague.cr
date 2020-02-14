class Subleague < Granite::Base
  connection sqlite
  table subleagues

  belongs_to :league

  column id : Int64, primary: true
  column name : String = ""

  validate_min_length :name, 2
  validate :league_id, "League must exists" do |t|
    League.exists? t.league_id
  end

  def to_s
    name.to_s
  end
end
