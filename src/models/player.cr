class Player < Granite::Base
  connection sqlite
  table players

  column id : Int64, primary: true
  column first_name : String = ""
  column last_name : String = ""
  column appendix : String?
end
