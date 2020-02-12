require "./spec_helper"
require "../../src/models/league.cr"

describe League do
  Spec.before_each do
    League.clear
  end

  it "needs at least 3 chars long name" do
    instance = League.new(name: "Fake League")
    (instance.valid?).should be_true

    instance = League.new(name: "")
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "Name name is too short. It must be at least 3"

    instance = League.new({"name" => "aa"}) # same result as `name: "aa"`
    (instance.valid?).should be_false
    instance.errors[0].to_s.should eq "Name name is too short. It must be at least 3"

    instance = League.new({"name" => "aaa"})
    (instance.valid?).should be_true
  end

  it "#to_s returns name" do
    instance = League.new(name: "Fake League")
    instance.to_s.should eq("Fake League")
  end
end
