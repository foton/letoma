- if player.errors
  ul.errors
    - player.errors.each do |error|
      li = error.to_s

== form(action: "/players/#{player.id.to_s}", method: player.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "first_name", value: player.first_name, placeholder: "First_name", class: "form-control")
  .form-group
    == text_field(name: "last_name", value: player.last_name, placeholder: "Last_name", class: "form-control")
  .form-group
    == text_field(name: "appendix", value: player.appendix, placeholder: "Appendix", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/players", class: "btn btn-light btn-sm")
