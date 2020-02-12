- unless tournament.errors.empty?
  ul.errors.alert.alert-danger
    - tournament.errors.each do |error|
      li = error.to_s

== form(action: "/tournaments/#{tournament.id.to_s}", method: tournament.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: tournament.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "start_date", value: tournament.start_date, placeholder: "Start_date", class: "form-control")
  .form-group
    == text_field(name: "end_date", value: tournament.end_date, placeholder: "End_date", class: "form-control")
  .form-group
    == label(:league)
    == select_field(name: "league_id", collection: League.all.map{|league| [league.id, league.name]}, selected: tournament.league_id, class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/tournaments", class: "btn btn-light btn-sm")
