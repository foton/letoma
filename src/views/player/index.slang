.row
  .col-sm-11
    h2 Players
  .col-sm-1
    a.btn.btn-success.btn-sm href="/players/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th First_name
        th Last_name
        th Appendix
        th Actions
    tbody
      - players.each do |player|
        tr
          td = player.first_name
          td = player.last_name
          td = player.appendix
          td
            span
              == link_to("Show", "/players/#{player.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/players/#{player.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/players/#{ player.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
