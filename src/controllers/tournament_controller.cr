class TournamentController < ApplicationController
  getter tournament = Tournament.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_tournament }
  end

  def index
    tournaments = Tournament.all
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
    tournament = Tournament.new
    update_attributes(tournament)
    if tournament.save
      redirect_to action: :index, flash: {"success" => "Tournament has been created."}
    else
      flash[:danger] = "Could not create Tournament!"
      render "new.slang"
    end
  end

  def update
    update_attributes(tournament)
    if tournament.save
      redirect_to action: :index, flash: {"success" => "Tournament has been updated."}
    else
      flash[:danger] = "Could not update Tournament!"
      render "edit.slang"
    end
  end

  def destroy
    tournament.destroy
    redirect_to action: :index, flash: {"success" => "Tournament has been deleted."}
  end

  private def tournament_params
    params.validation do
      required :name
      required :start_date
      required :end_date
      required :league_id
    end
  end

  private def set_tournament
    @tournament = Tournament.find! params[:id]
  end

  private def update_attributes(tournament)
    h = tournament_params.validate!
    tournament.start_date = Date.parse(h.delete("start_date").to_s)
    tournament.end_date = Date.parse(h.delete("end_date").to_s)
    tournament.set_attributes h
  end
end
