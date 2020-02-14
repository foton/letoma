h1 = game.name
p = game.stage_group.full_name
p = game.score
p
  == link_to("Back", "/games", class: "btn btn-light btn-sm")
  == link_to("Edit", "/games/#{game.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/games/#{game.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
