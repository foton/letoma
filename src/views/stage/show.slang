h1 Show Stage
p = stage.tournament.id
p = stage.subleague.id
p = stage.kind
p = stage.name
p
  == link_to("Back", "/stages", class: "btn btn-light btn-sm")
  == link_to("Edit", "/stages/#{stage.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/stages/#{stage.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
