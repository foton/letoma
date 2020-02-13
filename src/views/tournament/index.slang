.row
  .col-sm-11
    / t("tournament", count: 2) did not work
    h2 = t("tournament.other")
  .col-sm-1
    a.btn.btn-success.btn-sm href="/tournaments/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Start_date
        th End_date
        th League
        th Actions
    tbody
      - tournaments.each do |tournament|
        tr
          td == link_to(tournament.name, "/tournaments/#{tournament.id}")
          td = ::I18n.localize(tournament.start_date.to_time, scope: :date, format: :default)
          td = ::I18n.localize(tournament.end_date.to_time, scope: :date, format: :default)
          td == link_to(tournament.league.name.to_s, "/leagues/#{tournament.league.id}")
          td
            span
              == link_to("Edit", "/tournaments/#{tournament.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/tournaments/#{ tournament.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
