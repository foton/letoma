class Tournament < Granite::Base
  connection sqlite
  table tournaments

  belongs_to :league

  column id : Int64, primary: true
  column name : String = ""

  # column start_date : String
  # column end_date : String

  column start_date : Date = Date.today, column_type: "TEXT", converter: Granite::Converters::Date(String)
  column end_date : Date = Date.today, column_type: "TEXT", converter: Granite::Converters::Date(String)

  validate_min_length :name, 3
  validate :league_id, "League must exists" do |t|
    League.exists? t.league_id
  end

  # TODO: figure out how to add Date to Granite::Columns::Type
  # this does not work
  #
  # def initialize(**args : Granite::Columns::Type | Date)
  #   granite_args = args.to_h.transform_keys(&.to_s)
  #   self.start_date = granite_args.delete("start_date")
  #   self.end_date = granite_args.delete("end_date")
  #   set_attributes(granite_args)
  # end

  # def initialize(args : Granite::ModelArgs | Date)
  #   args = args.transform_keys(&.to_s)
  #   self.start_date = args.delete("start_date")
  #   self.end_date = args.delete("end_date")
  #   set_attributes(args)
  # end
end


