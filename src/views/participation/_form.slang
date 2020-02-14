- if participation.errors
  ul.errors
    - participation.errors.each do |error|
      li = error.to_s

== form(action: "/participations/#{participation.id.to_s}", method: participation.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:tournament)
    == select_field(name: "tournament_id", collection: Tournament.all.map{|tournament| [tournament.id, tournament.name]}, selected: participation.tournament_id, class: "form-control")
  .form-group
    == label(:subleague)
    == select_field(name: "subleague_id", collection: Subleague.all.map{|subleague| [subleague.id, subleague.name]}, selected: participation.subleague_id, class: "form-control")
  .form-group
    == label(:player)
    == select_field(name: "player_id", collection: Player.all.map{|player| [player.id, player.name]}, selected: participation.player_id, class: "form-control")
    == link_to("Add player", "/players/new", class: "btn btn-light btn-sm")
  == submit("Submit", class: "btn btn-success btn-sm")

