class Game < Granite::Base
  connection sqlite
  table games

  belongs_to :stage_group

  belongs_to :left_side, class_name: Participation
  belongs_to :right_side, class_name: Participation

  column id : Int64, primary: true
  column left_score : Int64?
  column right_score : Int64?

  def players
    [left_side.player, right_side.player]
  end

  def name
    players.map {|p| p.name }.join(" vs ")
  end

  def score
    left_score.to_s + " : " + right_score.to_s
  end

  def finished?
    !(left_score.nil? || right_score.nil?)
  end
end
