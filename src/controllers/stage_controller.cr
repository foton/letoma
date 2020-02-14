class StageController < ApplicationController
  getter stage = Stage.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_stage }
  end

  def index
    stages = Stage.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    stage = Stage.new stage_params.validate!
    if stage.save
      redirect_to action: :index, flash: {"success" => "Stage has been created."}
    else
      flash[:danger] = "Could not create Stage!"
      render "new.slang"
    end
  end

  def update
    stage.set_attributes stage_params.validate!
    if stage.save
      redirect_to action: :index, flash: {"success" => "Stage has been updated."}
    else
      flash[:danger] = "Could not update Stage!"
      render "edit.slang"
    end
  end

  def destroy
    stage.destroy
    redirect_to action: :index, flash: {"success" => "Stage has been deleted."}
  end

  private def stage_params
    params.validation do
      required :tournament_id
      required :subleague_id
      required :kind
      required :name
    end
  end

  private def set_stage
    @stage = Stage.find! params[:id]
  end
end
