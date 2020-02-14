.row
  .col-sm-11
    h2 Games
  .col-sm-1
    a.btn.btn-success.btn-sm href="/games/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Stage_group
        th Left_side
        th Right_side
        th Score
        th Actions
    tbody
      - games.each do |game|
        tr
          td = game.stage_group.full_name
          td = game.left_side.name
          td = game.right_side.name
          td = game.score
          td
            span
              == link_to("Show", "/games/#{game.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/games/#{game.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/games/#{ game.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
