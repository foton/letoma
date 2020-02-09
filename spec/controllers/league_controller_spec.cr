require "./spec_helper"

def league_hash
  {"name" => "Fake League"}
end

def league_params_str
  build_params_string_from(league_hash)
end

def build_params_string_from(hash)
  params = [] of String
  hash.each do |k,v|
    params << "#{k}=#{v}"
  end
  params.join("&")
end

def create_league
  model = League.new(league_hash)
  model.save
  model
end

class LeagueControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe LeagueControllerTest do
  subject = LeagueControllerTest.new

  it "renders league index template" do
    League.clear
    model = create_league

    response = subject.get "/leagues"

    response.status_code.should eq(200)
    response.body.should contain("leagues")
    response.body.should contain(model.name.to_s)
  end

  it "renders league show template" do
    League.clear
    model = create_league
    location = "/leagues/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show League")
    response.body.should contain(model.name.to_s)
  end

  it "renders league new template" do
    League.clear
    location = "/leagues/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New League")
  end

  it "renders league edit template" do
    League.clear
    model = create_league
    location = "/leagues/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit League")
    response.body.should contain(model.name.to_s)
  end

  it "creates a league" do
    League.clear
    response = subject.post "/leagues", body: league_params_str

    response.headers["Location"].should eq "/leagues"
    response.status_code.should eq(302)
    response.body.should eq "302"
    # TODO test redirection to new league
    # find league by name
  end

  it "updates a league" do
    League.clear
    model = create_league
    new_name = "Second league"
    league_params = build_params_string_from(league_hash.merge({ "name" => new_name}))

    response = subject.patch "/leagues/#{model.id}", body: league_params

    response.headers["Location"].should eq "/leagues"
    response.status_code.should eq(302)
    response.body.should eq "302"

    puts("League.all: #{League.all.to_json}")
    League.find!(model.id).name.should eq(new_name)
  end

  it "deletes a league" do
    League.clear
    model = create_league
    response = subject.delete "/leagues/#{model.id}"

    response.headers["Location"].should eq "/leagues"
    response.status_code.should eq(302)
    response.body.should eq "302"

    League.find(model.id).should be_nil
  end
end
