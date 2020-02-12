- unless league.errors.empty?
  ul.errors.alert.alert-danger
    - league.errors.each do |error|
      li = error.to_s

== form(action: "/leagues/#{league.id.to_s}", method: league.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: league.name, placeholder: "Name", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/leagues", class: "btn btn-light btn-sm")
