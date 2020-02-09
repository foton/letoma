class League < Granite::Base
  connection sqlite
  table leagues

  column id : Int64, primary: true
  column name : String?

  validate(:name, "Cannot be blank", ->(x : self) { !x.name.to_s.blank? })
  # validate :name, "cannot be blank" do |this|
  #   !this.name.blank?
  # end
end
