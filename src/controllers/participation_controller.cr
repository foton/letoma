class ParticipationController < ApplicationController
  getter participation = Participation.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_participation }
  end

  def index
    participations = Participation.all
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
    participation = Participation.new participation_params.validate!
    if participation.save
      redirect_to action: :index, flash: {"success" => "Participation has been created."}
    else
      flash[:danger] = "Could not create Participation!"
      render "new.slang"
    end
  end

  def update
    participation.set_attributes participation_params.validate!
    if participation.save
      redirect_to action: :index, flash: {"success" => "Participation has been updated."}
    else
      flash[:danger] = "Could not update Participation!"
      render "edit.slang"
    end
  end

  def destroy
    participation.destroy
    redirect_to action: :index, flash: {"success" => "Participation has been deleted."}
  end

  private def participation_params
    params.validation do
      required :tournament_id
      required :subleague_id
      required :player_id
    end
  end

  private def set_participation
    @participation = Participation.find! params[:id]
  end
end
