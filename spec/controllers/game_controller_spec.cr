require "./spec_helper"

def game_hash
  {"stage_group_id" => "1", "left_side_id" => "1", "right_side_id" => "1", "left_score" => "1", "right_score" => "1"}
end

def game_params
  params = [] of String
  params << "stage_group_id=#{game_hash["stage_group_id"]}"
  params << "left_side_id=#{game_hash["left_side_id"]}"
  params << "right_side_id=#{game_hash["right_side_id"]}"
  params << "left_score=#{game_hash["left_score"]}"
  params << "right_score=#{game_hash["right_score"]}"
  params.join("&")
end

def create_game
  model = Game.new(game_hash)
  model.save
  model
end

class GameControllerTest < GarnetSpec::Controller::Test
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

describe GameControllerTest do
  subject = GameControllerTest.new

  it "renders game index template" do
    Game.clear
    response = subject.get "/games"

    response.status_code.should eq(200)
    response.body.should contain("games")
  end

  it "renders game show template" do
    Game.clear
    model = create_game
    location = "/games/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain(model.name)
  end

  it "renders game new template" do
    Game.clear
    location = "/games/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Game")
  end

  it "renders game edit template" do
    Game.clear
    model = create_game
    location = "/games/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Game")
  end

  it "creates a game" do
    Game.clear
    response = subject.post "/games", body: game_params

    response.headers["Location"].should eq "/games"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a game" do
    Game.clear
    model = create_game
    response = subject.patch "/games/#{model.id}", body: game_params

    response.headers["Location"].should eq "/games"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a game" do
    Game.clear
    model = create_game
    response = subject.delete "/games/#{model.id}"

    response.headers["Location"].should eq "/games"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
