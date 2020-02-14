class Player < Granite::Base
  connection sqlite
  table players

  column id : Int64, primary: true
  column first_name : String = ""
  column last_name : String = ""
  column appendix : String?

  def name
    first_name + " " + last_name + (appendix.to_s.blank? ? "" : " #{appendix}")
  end
end
