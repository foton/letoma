.row
  .col-sm-11
    h2 Stages
  .col-sm-1
    a.btn.btn-success.btn-sm href="/stages/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Tournament
        th Subleague
        th Kind
        th Name
        th Actions
    tbody
      - stages.each do |stage|
        tr
          td = stage.tournament.name
          td = stage.subleague.name
          td = stage.kind
          td = stage.name
          td
            span
              == link_to("Show", "/stages/#{stage.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/stages/#{stage.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/stages/#{ stage.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
