require "./spec_helper"

def stage_hash
  {"tournament_id" => "1", "subleague_id" => "1", "kind" => "Fake", "name" => "Fake"}
end

def stage_params
  params = [] of String
  params << "tournament_id=#{stage_hash["tournament_id"]}"
  params << "subleague_id=#{stage_hash["subleague_id"]}"
  params << "kind=#{stage_hash["kind"]}"
  params << "name=#{stage_hash["name"]}"
  params.join("&")
end

def create_stage
  model = Stage.new(stage_hash)
  model.save
  model
end

class StageControllerTest < GarnetSpec::Controller::Test
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

describe StageControllerTest do
  subject = StageControllerTest.new

  it "renders stage index template" do
    Stage.clear
    response = subject.get "/stages"

    response.status_code.should eq(200)
    response.body.should contain("stages")
  end

  it "renders stage show template" do
    Stage.clear
    model = create_stage
    location = "/stages/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain(model.medium_name)
  end

  it "renders stage new template" do
    Stage.clear
    location = "/stages/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Stage")
  end

  it "renders stage edit template" do
    Stage.clear
    model = create_stage
    location = "/stages/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Stage")
  end

  it "creates a stage" do
    Stage.clear
    response = subject.post "/stages", body: stage_params

    response.headers["Location"].should eq "/stages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a stage" do
    Stage.clear
    model = create_stage
    response = subject.patch "/stages/#{model.id}", body: stage_params

    response.headers["Location"].should eq "/stages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a stage" do
    Stage.clear
    model = create_stage
    response = subject.delete "/stages/#{model.id}"

    response.headers["Location"].should eq "/stages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
