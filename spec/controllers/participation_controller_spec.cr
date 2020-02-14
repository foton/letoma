require "./spec_helper"

def participation_hash
  {"tournament_id" => "1", "subleague_id" => "1", "player_id" => "1"}
end

def participation_params
  params = [] of String
  params << "tournament_id=#{participation_hash["tournament_id"]}"
  params << "subleague_id=#{participation_hash["subleague_id"]}"
  params << "player_id=#{participation_hash["player_id"]}"
  params.join("&")
end

def create_participation
  model = Participation.new(participation_hash)
  model.save
  model
end

class ParticipationControllerTest < GarnetSpec::Controller::Test
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

describe ParticipationControllerTest do
  subject = ParticipationControllerTest.new

  it "renders participation index template" do
    Participation.clear
    response = subject.get "/participations"

    response.status_code.should eq(200)
    response.body.should contain("participations")
  end

  it "renders participation show template" do
    Participation.clear
    model = create_participation
    location = "/participations/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Participation")
  end

  it "renders participation new template" do
    Participation.clear
    location = "/participations/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Participation")
  end

  it "renders participation edit template" do
    Participation.clear
    model = create_participation
    location = "/participations/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Participation")
  end

  it "creates a participation" do
    Participation.clear
    response = subject.post "/participations", body: participation_params

    response.headers["Location"].should eq "/participations"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a participation" do
    Participation.clear
    model = create_participation
    response = subject.patch "/participations/#{model.id}", body: participation_params

    response.headers["Location"].should eq "/participations"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a participation" do
    Participation.clear
    model = create_participation
    response = subject.delete "/participations/#{model.id}"

    response.headers["Location"].should eq "/participations"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
