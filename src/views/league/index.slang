.row
  .col-sm-11
    h2 = t("league.other")
  .col-sm-1
    a.btn.btn-success.btn-sm href="/leagues/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Actions
    tbody
      - leagues.each do |league|
        tr
          td == link_to(league.name, "/leagues/#{league.id}/edit")
          td
            span
              == link_to("Edit", "/leagues/#{league.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/leagues/#{ league.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
