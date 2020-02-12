require "./spec_helper"
require "../../src/models/tournament.cr"

def valid_attributes
  { name: "Fake Tournament",
    league_id: league.id }  # This is not Hash but NamedTuple!
end

def league
  League.first || League.create(name: "Fake League")
end

describe Tournament do
  # Spec.before_each do
  #   Tournament.clear
  # end

  it "builds with valid_attributes" do
    instance = Tournament.new(valid_attributes.to_h)
    (instance.valid?).should be_true
  end

  it "needs name at leats 3 chars long" do
    instance = Tournament.new(valid_attributes.to_h)

    instance.name =""
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "Name name is too short. It must be at least 3"

    instance.name = "aa"
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "Name name is too short. It must be at least 3"

    instance.name = "aaa"
    (instance.valid?).should be_true
  end

  it "always belongs to league" do
    instance = Tournament.new(name: "xxx", league_id: nil)
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "League_id League must exists"
  end

  pending "needs time period" do
    # with correct start-end order
    # needs Garanite Converters (sqlite)"String" to (crystal)date
    # https://github.com/amberframework/granite/blob/master/docs/models.md#converters


  end
end
