- if stage.errors
  ul.errors
    - stage.errors.each do |error|
      li = error.to_s

== form(action: "/stages/#{stage.id.to_s}", method: stage.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:tournament)
    == select_field(name: "tournament_id", collection: Tournament.all.map{|tournament| [tournament.id, tournament.name]}, selected: stage.tournament_id, class: "form-control")
  .form-group
    == label(:subleague)
    == select_field(name: "subleague_id", collection: Subleague.all.map{|subleague| [subleague.id, subleague.name]}, selected: stage.subleague_id, class: "form-control")
  .form-group
    == label(:kind)
    == select_field(name: "kind", collection: Stage::KINDS.map{|k| [k, k]}, selected: stage.kind, class: "form-control")
  .form-group
    == text_field(name: "name", value: stage.name, placeholder: "Name", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/stages", class: "btn btn-light btn-sm")
