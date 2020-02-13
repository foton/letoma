h1 = t("league.one") + ": " + league.name
p
  == link_to("Back", "/leagues", class: "btn btn-light btn-sm")
  == link_to("Edit", "/leagues/#{league.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/leagues/#{league.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
