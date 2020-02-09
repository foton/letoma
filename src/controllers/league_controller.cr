class LeagueController < ApplicationController
  getter league = League.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_league }
  end

  def index
    leagues = League.all
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
    league = League.new league_params.validate!
    if league.save
      redirect_to action: :index, flash: {"success" => "League has been created."}
    else
      flash[:danger] = "Could not create League!"
      render "new.slang"
    end
  end

  def update
    league.set_attributes league_params.validate!
    if league.save
      redirect_to action: :index, flash: {"success" => "League has been updated."}
    else
      flash[:danger] = "Could not update League!"
      render "edit.slang"
    end
  end

  def destroy
    league.destroy
    redirect_to action: :index, flash: {"success" => "League has been deleted."}
  end

  private def league_params
    params.validation do
      required :name
    end
  end

  private def set_league
    @league = League.find! params[:id]
  end
end
