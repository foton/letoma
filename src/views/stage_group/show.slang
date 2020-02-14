h1 = stage_group.full_name
p
  == link_to("Back", "/stage_groups", class: "btn btn-light btn-sm")
  == link_to("Edit", "/stage_groups/#{stage_group.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/stage_groups/#{stage_group.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

h2 Players
- stage_group.players.each do |player|
    == link_to(player.name, "/players/#{player.id}", class: "btn btn-light btn-sm")
  end

h2 Games
- stage_group.games.each do |game|
    == link_to(game.name + (game.finished? ? "<br />#{game.score}" : ""), "/games/#{game.id}", class: "btn btn-light btn-sm")
  end

