class StageGroupController < ApplicationController
  getter stage_group = StageGroup.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_stage_group }
  end

  def index
    stage_groups = StageGroup.all
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
    stage_group = StageGroup.new stage_group_params.validate!
    if stage_group.save
      redirect_to action: :index, flash: {"success" => "Stage_group has been created."}
    else
      flash[:danger] = "Could not create StageGroup!"
      render "new.slang"
    end
  end

  def update
    stage_group.set_attributes stage_group_params.validate!
    if stage_group.save
      redirect_to action: :index, flash: {"success" => "Stage_group has been updated."}
    else
      flash[:danger] = "Could not update StageGroup!"
      render "edit.slang"
    end
  end

  def destroy
    stage_group.destroy
    redirect_to action: :index, flash: {"success" => "Stage_group has been deleted."}
  end

  private def stage_group_params
    params.validation do
      required :stage_id
      required :name
    end
  end

  private def set_stage_group
    @stage_group = StageGroup.find! params[:id]
  end
end
