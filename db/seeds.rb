# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


team_names = [
  "Atlanta Hawks",
  "Boston Celtics",
  "Brooklyn Nets",
  "Charlotte Hornets",
  "Chicago Bulls",
  "Cleveland Cavaliers",
  "Dallas Mavericks",
  "Denver Nuggets",
  "Detroit Pistons",
  "Golden State Warriors",
  "Houston Rockets",
  "Indiana Pacers",
  "Los Angeles Clippers",
  "Los Angeles Lakers",
  "Memphis Grizzlies",
  "Miami Heat",
  "Milwaukee Bucks",
  "Minnesota Timberwolves",
  "New Orleans Pelicans",
  "New York Knicks",
  "Oklahoma City Thunder",
  "Orlando Magic",
  "Philadelphia 76ers",
  "Phoenix Suns",
  "Portland Trail Blazers",
  "Sacramento Kings",
  "San Antonio Spurs",
  "Toronto Raptors",
  "Utah Jazz",
  "Washington Wizards"
]

team_names.each do |team|
  5.times do |n|
    games_played = n
    if n == 0
      wins = 0
      losses = 0
      win_loss_pct = 1.0
    else
      last_wins = Standing.last.wins
      last_losses = Standing.last.losses
      winz = [true, false].sample
      if winz
        wins = last_wins + 1
        losses = last_losses
        win_loss_pct = wins.to_f / games_played.to_f
      else
        wins = last_wins
        losses = last_losses + 1
        win_loss_pct = wins.to_f / games_played.to_f
      end
    end


    Standing.create!(
                     team_name: team,
                     games_played: games_played,
                     wins: wins,
                     losses: losses,
                     win_loss_pct: win_loss_pct
                     )

    Standing.create!(
                     team_name: "#{team} Goal",
                     games_played: games_played,
                     wins: wins,
                     losses: losses,
                     win_loss_pct: 0.500
                     )


  end
end
