.row
  .col-sm-11
    h2 Participations
  .col-sm-1
    a.btn.btn-success.btn-sm href="/participations/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Tournament
        th Subleague
        th Player
        th Actions
    tbody
      - participations.each do |participation|
        tr
          td = participation.tournament.id
          td = participation.subleague.id
          td = participation.player.id
          td
            span
              == link_to("Show", "/participations/#{participation.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/participations/#{participation.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/participations/#{ participation.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
