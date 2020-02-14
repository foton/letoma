h1 Show Subleague
p = subleague.name
p = subleague.league.id
p
  == link_to("Back", "/subleagues", class: "btn btn-light btn-sm")
  == link_to("Edit", "/subleagues/#{subleague.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/subleagues/#{subleague.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
