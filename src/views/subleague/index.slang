.row
  .col-sm-11
    h2 Subleagues
  .col-sm-1
    a.btn.btn-success.btn-sm href="/subleagues/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th League
        th Actions
    tbody
      - subleagues.each do |subleague|
        tr
          td = subleague.name
          td = subleague.league.id
          td
            span
              == link_to("Show", "/subleagues/#{subleague.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/subleagues/#{subleague.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/subleagues/#{ subleague.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
