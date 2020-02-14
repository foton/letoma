- if game.errors
  ul.errors
    - game.errors.each do |error|
      li = error.to_s

== form(action: "/games/#{game.id.to_s}", method: game.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:stage_group)
    == select_field(name: "stage_group_id", collection: StageGroup.all.map{|stage_group| [stage_group.id, stage_group.full_name]}, selected: game.stage_group_id, class: "form-control")
  .form-group
    == label(:left_side)
    == select_field(name: "left_side_id", collection: Participation.all.map{|left_side| [left_side.id, left_side.name]}, selected: game.left_side_id, class: "form-control")
  .form-group
    == label(:right_side)
    == select_field(name: "right_side_id", collection: Participation.all.map{|right_side| [right_side.id, right_side.name]}, selected: game.right_side_id, class: "form-control")
  .form-group
    == label(:left_score)
    == text_field(name: "left_score", value: game.left_score, placeholder: "Left_score", class: "form-control")
  .form-group
    == label(:right_score)
    == text_field(name: "right_score", value: game.right_score, placeholder: "Right_score", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/games", class: "btn btn-light btn-sm")
