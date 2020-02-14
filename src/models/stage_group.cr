class StageGroup < Granite::Base
  connection sqlite
  table stage_groups

  belongs_to :stage
  has_many :games, class_name: Game

  column id : Int64, primary: true
  column name : String=""

  def full_name
    stage.full_name + " - " + name
  end

  def players
    players = Set(Player).new
    games.map do |g|
      players << g.players.first
      players << g.players.last
    end
    players
  end
end
