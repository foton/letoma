require "./spec_helper"

def stage_group_hash
  {"stage_id" => "1", "name" => "Fake"}
end

def stage_group_params
  params = [] of String
  params << "stage_id=#{stage_group_hash["stage_id"]}"
  params << "name=#{stage_group_hash["name"]}"
  params.join("&")
end

def create_stage_group
  model = StageGroup.new(stage_group_hash)
  model.save
  model
end

class StageGroupControllerTest < GarnetSpec::Controller::Test
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

describe StageGroupControllerTest do
  subject = StageGroupControllerTest.new

  it "renders stage_group index template" do
    StageGroup.clear
    response = subject.get "/stage_groups"

    response.status_code.should eq(200)
    response.body.should contain("stage_groups")
  end

  it "renders stage_group show template" do
    StageGroup.clear
    model = create_stage_group
    location = "/stage_groups/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain(model.stage.full_name + " - " + model.name)
  end

  it "renders stage_group new template" do
    StageGroup.clear
    location = "/stage_groups/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Stage Group")
  end

  it "renders stage_group edit template" do
    StageGroup.clear
    model = create_stage_group
    location = "/stage_groups/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Stage Group")
  end

  it "creates a stage_group" do
    StageGroup.clear
    response = subject.post "/stage_groups", body: stage_group_params

    response.headers["Location"].should eq "/stage_groups"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a stage_group" do
    StageGroup.clear
    model = create_stage_group
    response = subject.patch "/stage_groups/#{model.id}", body: stage_group_params

    response.headers["Location"].should eq "/stage_groups"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a stage_group" do
    StageGroup.clear
    model = create_stage_group
    response = subject.delete "/stage_groups/#{model.id}"

    response.headers["Location"].should eq "/stage_groups"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
