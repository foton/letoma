class Tournament < Granite::Base
  connection sqlite
  table tournaments

  belongs_to :league

  column id : Int64, primary: true
  column name : String?
  column start_date : String?
  column end_date : String?

  validate_min_length :name, 3
  validate :league_id, "League must exists" do |t|
    League.exists? t.league_id
  end
end
