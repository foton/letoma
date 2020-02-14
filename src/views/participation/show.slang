h1 Show Participation
p = participation.tournament.id
p = participation.subleague.id
p = participation.player.id
p
  == link_to("Back", "/participations", class: "btn btn-light btn-sm")
  == link_to("Edit", "/participations/#{participation.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/participations/#{participation.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
