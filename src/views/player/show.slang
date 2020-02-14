h1 Show Player
p = player.first_name
p = player.last_name
p = player.appendix
p
  == link_to("Back", "/players", class: "btn btn-light btn-sm")
  == link_to("Edit", "/players/#{player.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/players/#{player.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
