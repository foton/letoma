- if subleague.errors
  ul.errors
    - subleague.errors.each do |error|
      li = error.to_s

== form(action: "/subleagues/#{subleague.id.to_s}", method: subleague.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: subleague.name, placeholder: "Name", class: "form-control")
  .form-group
    == label(:league)
    == select_field(name: "league_id", collection: League.all.map{|league| [league.id, league.name]}, selected: subleague.league_id, class: "form-control col-sm-10")
  == submit("Submit", class: "btn btn-success btn-sm")

