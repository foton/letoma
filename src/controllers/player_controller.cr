class PlayerController < ApplicationController
  getter player = Player.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_player }
  end

  def index
    players = Player.all
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
    player = Player.new player_params.validate!
    if player.save
      redirect_to action: :index, flash: {"success" => "Player has been created."}
    else
      flash[:danger] = "Could not create Player!"
      render "new.slang"
    end
  end

  def update
    player.set_attributes player_params.validate!
    if player.save
      redirect_to action: :index, flash: {"success" => "Player has been updated."}
    else
      flash[:danger] = "Could not update Player!"
      render "edit.slang"
    end
  end

  def destroy
    player.destroy
    redirect_to action: :index, flash: {"success" => "Player has been deleted."}
  end

  private def player_params
    params.validation do
      required :first_name
      required :last_name
#      required :appendix
    end
  end

  private def set_player
    @player = Player.find! params[:id]
  end
end
