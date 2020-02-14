- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/leagues" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/leagues" Leagues
- active = context.request.path == "/tournaments" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/tournaments" Tournaments
- active = context.request.path == "/subleagues" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/subleagues" Subleagues
- active = context.request.path == "/players" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/players" Players
- active = context.request.path == "/participations" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/participations" Participations
- active = context.request.path == "/stages" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/stages" Stages
- active = context.request.path == "/stage_groups" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/stage_groups" Stage Groups
