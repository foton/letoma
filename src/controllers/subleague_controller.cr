class SubleagueController < ApplicationController
  getter subleague = Subleague.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_subleague }
  end

  def index
    subleagues = Subleague.all
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
    subleague = Subleague.new subleague_params.validate!
    if subleague.save
      redirect_to action: :index, flash: {"success" => "Subleague has been created."}
    else
      flash[:danger] = "Could not create Subleague!"
      render "new.slang"
    end
  end

  def update
    subleague.set_attributes subleague_params.validate!
    if subleague.save
      redirect_to action: :index, flash: {"success" => "Subleague has been updated."}
    else
      flash[:danger] = "Could not update Subleague!"
      render "edit.slang"
    end
  end

  def destroy
    subleague.destroy
    redirect_to action: :index, flash: {"success" => "Subleague has been deleted."}
  end

  private def subleague_params
    params.validation do
      required :name
      required :league_id
    end
  end

  private def set_subleague
    puts("looking for #{params[:id]} in #{Subleague.all.to_json}")
    @subleague = Subleague.find! params[:id]
  end
end
