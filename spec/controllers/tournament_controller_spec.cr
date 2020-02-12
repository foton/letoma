require "./spec_helper"

def league
  League.first || League.create(name: "Fake League")
end

def tournament_hash
  { "name" => "Fake",
    "start_date" => Date.new(2019, 12, 28).to_s,
    "end_date" => Date.new(2019, 12,28).to_s,
    "league_id" => league.id }
end

def tournament_params
  params = [] of String
  params << "name=#{tournament_hash["name"]}"
  params << "start_date=#{tournament_hash["start_date"]}"
  params << "end_date=#{tournament_hash["end_date"]}"
  params << "league_id=#{tournament_hash["league_id"]}"
  params.join("&")
end

def create_tournament(h = tournament_hash)
  model = Tournament.new
  model.start_date = Date.parse(h.delete("start_date").to_s)
  model.end_date = Date.parse(h.delete("end_date").to_s)
  model.set_attributes h

  model.save!
  model
end

class TournamentControllerTest < GarnetSpec::Controller::Test
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

describe TournamentControllerTest do
  subject = TournamentControllerTest.new

  it "renders tournament index template" do
    Tournament.clear
    model1 = create_tournament
    model2 = create_tournament(tournament_hash.merge({"name" => "Tournament2"}))
    response = subject.get "/tournaments"

    response.status_code.should eq(200)
    response.body.should contain("tournaments")
  end

  it "renders tournament show template" do
    Tournament.clear
    model = create_tournament
    location = "/tournaments/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain(model.name.to_s)
    response.body.should contain(model.league.name.to_s)
  end

  it "renders tournament new template" do
    Tournament.clear
    location = "/tournaments/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Tournament")
  end

  it "renders tournament edit template" do
    Tournament.clear
    model = create_tournament
    location = "/tournaments/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Tournament")
  end

  it "creates a tournament" do
    Tournament.clear
    response = subject.post "/tournaments", body: tournament_params

    response.headers["Location"].should eq "/tournaments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a tournament" do
    Tournament.clear
    model = create_tournament
    response = subject.patch "/tournaments/#{model.id}", body: tournament_params

    response.headers["Location"].should eq "/tournaments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a tournament" do
    Tournament.clear
    model = create_tournament
    response = subject.delete "/tournaments/#{model.id}"

    # puts("response.headers: #{response.headers}")
    # puts("response.body: #{response.body}")
    # puts("response.status_code: #{response.status_code}")
    response.headers["Location"].should eq "/tournaments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
