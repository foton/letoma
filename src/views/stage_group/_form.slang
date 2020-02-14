- if stage_group.errors
  ul.errors
    - stage_group.errors.each do |error|
      li = error.to_s

== form(action: "/stage_groups/#{stage_group.id.to_s}", method: stage_group.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:stage)
    == select_field(name: "stage_id", collection: Stage.all.map{|stage| [stage.id, stage.full_name]}, selected: stage_group.stage_id, class: "form-control")
  .form-group
    == text_field(name: "name", value: stage_group.name, placeholder: "Name", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/stage_groups", class: "btn btn-light btn-sm")
