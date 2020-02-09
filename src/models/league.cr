class League < Granite::Base
  connection sqlite
  table leagues

  column id : Int64, primary: true
  column name : String?
end
