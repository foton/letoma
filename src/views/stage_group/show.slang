h1 = stage_group.stage.full_name + " - " + stage_group.name
p
  == link_to("Back", "/stage_groups", class: "btn btn-light btn-sm")
  == link_to("Edit", "/stage_groups/#{stage_group.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/stage_groups/#{stage_group.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

h2 Games/Matches
