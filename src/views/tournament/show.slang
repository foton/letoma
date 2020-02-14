h1 = t("tournament.one") + ": " + tournament.name.to_s
p = "#{tournament.start_date.to_s} - #{tournament.end_date.to_s}"
p = "League: #{tournament.league.name}"
p
  == link_to("Back", "/tournaments", class: "btn btn-light btn-sm")
  == link_to("Edit", "/tournaments/#{tournament.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/tournaments/#{tournament.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

- tournament.league.subleagues.each do |subleague|
 h2 = subleague.name
 ul
   - Participation.for_tournament_and_subleague(tournament, subleague).each do |participation|
       li = participation.player.name
     end
end

