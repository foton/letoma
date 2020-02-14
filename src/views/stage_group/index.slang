.row
  .col-sm-11
    h2 Stage Groups
  .col-sm-1
    a.btn.btn-success.btn-sm href="/stage_groups/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Stage
        th Name
        th Actions
    tbody
      - stage_groups.each do |stage_group|
        tr
          td = stage_group.stage.full_name
          td = stage_group.name
          td
            span
              == link_to("Show", "/stage_groups/#{stage_group.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/stage_groups/#{stage_group.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/stage_groups/#{ stage_group.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
