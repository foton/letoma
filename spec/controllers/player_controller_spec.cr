require "./spec_helper"

def player_hash
  {"first_name" => "John", "last_name" => "Done", "appendix" => ""}
end

def player_params
  params = [] of String
  params << "first_name=#{player_hash["first_name"]}"
  params << "last_name=#{player_hash["last_name"]}"
  params << "appendix=#{player_hash["appendix"]}"
  params.join("&")
end

def create_player
  model = Player.new(player_hash)
  model.save!
  model
end

class PlayerControllerTest < GarnetSpec::Controller::Test
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

describe PlayerControllerTest do
  subject = PlayerControllerTest.new

  it "renders player index template" do
    Player.clear
    response = subject.get "/players"

    response.status_code.should eq(200)
    response.body.should contain("players")
  end

  it "renders player show template" do
    Player.clear
    model = create_player
    location = "/players/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Player")
  end

  it "renders player new template" do
    Player.clear
    location = "/players/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Player")
  end

  it "renders player edit template" do
    Player.clear
    model = create_player
    location = "/players/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Player")
  end

  it "creates a player" do
    Player.clear
    response = subject.post "/players", body: player_params

    response.headers["Location"].should eq "/players"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a player" do
    Player.clear
    model = create_player
    response = subject.patch "/players/#{model.id}", body: player_params

    response.headers["Location"].should eq "/players"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a player" do
    Player.clear
    model = create_player
    response = subject.delete "/players/#{model.id}"

    response.headers["Location"].should eq "/players"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
