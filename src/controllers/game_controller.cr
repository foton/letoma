class GameController < ApplicationController
  getter game = Game.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_game }
  end

  def index
    games = Game.all
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
    game = Game.new
    update_game(game)
    if game.save
      redirect_to action: :index, flash: {"success" => "Game has been created."}
    else
      flash[:danger] = "Could not create Game!"
      render "new.slang"
    end
  end

  def update
    update_game(game)
    if game.save
      redirect_to action: :index, flash: {"success" => "Game has been updated."}
    else
      flash[:danger] = "Could not update Game!"
      render "edit.slang"
    end
  end

  def destroy
    game.destroy
    redirect_to action: :index, flash: {"success" => "Game has been deleted."}
  end

  private def game_params
    params.validation do
      required :stage_group_id
      required :left_side_id
      required :right_side_id
      optional(:left_score) { |v| v.blank? || v.numeric? }
      optional(:right_score) { |v| v.blank? || v.numeric? }
    end
  end

  private def set_game
    @game = Game.find! params[:id]
  end

  private def update_game(game)
    puts("**** GAME PARAMS: #{game.to_json}")
    gp = game_params.validate!
    puts("**** GAME PARAMS validate: #{gp.to_json}")
    puts("**** GAME before: #{game.to_json}")
    left_score = gp.delete("left_score").to_s
    right_score = gp.delete("right_score").to_s
    game.set_attributes(gp)
    if left_score.blank? || right_score.blank?
      game.left_score = nil
      game.right_score = nil
    else
      game.left_score = left_score.to_i64
      game.right_score = right_score.to_i64
    end
    puts("**** GAME after: #{game.to_json}")
  end

end
