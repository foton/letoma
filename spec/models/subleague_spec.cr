require "./spec_helper"
require "../../src/models/subleague.cr"


def valid_subleague
  Subleague.new(name: "Mens", league_id: league.id)
end

def league
  League.first || League.create(name: "Fake League")
end

describe Subleague do
  # Spec.before_each do
  #   Subleague.clear
  # end

  it "builds with valid_attributes" do
    (valid_subleague.valid?).should be_true
  end

  it "needs name at least 2 chars long" do
    instance = valid_subleague

    instance.name =""
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "Name name is too short. It must be at least 2"

    instance.name = "aa"
    (instance.valid?).should be_true
  end

  it "always belongs to league" do
    instance = valid_subleague
    instance.league_id = 11111111
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "League_id League must exists"
  end
end
