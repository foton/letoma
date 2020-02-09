require "./spec_helper"
require "../../src/models/league.cr"

describe League do
  Spec.before_each do
    League.clear
  end

  it "needs name" do
    l=League.new({"name" => "Fake League"})
    (l.valid?).should be_true

    l=League.new({"name" => ""})
    (l.valid?).should be_false
  end
end
