require "./spec_helper"
require "../../src/models/date.cr"

describe Date do
  it "parses string" do
    d = Date.parse("2019-11-13")
    d.to_s.should eq("2019-11-13")
    d.day.should eq(13)
    d.month.should eq(11)
    d.year.should eq(2019)
  end

  it "can be created" do
    d = Date.new(2020,12,23)
    d.to_s.should eq("2020-12-23")
  end
end
