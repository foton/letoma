class Participation < Granite::Base
  connection sqlite
  table participations

  belongs_to :tournament
  belongs_to :subleague
  belongs_to :player

  column id : Int64, primary: true

  def self.for_tournament_and_subleague(tournament, subleague)
    self.where(tournament_id: tournament.id, subleague_id: subleague.id)
  end

  def name
    player.name
  end
end
