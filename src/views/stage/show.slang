h1 = stage.full_name
p = stage.kind
p
  == link_to("Back", "/stages", class: "btn btn-light btn-sm")
  == link_to("Edit", "/stages/#{stage.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/stages/#{stage.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

h2 Stage Groups
- stage.stage_groups.each do |stage_group|
    == link_to(stage_group.name, "/stage_groups/#{stage_group.id}", class: "btn btn-success btn-sm")
  end

