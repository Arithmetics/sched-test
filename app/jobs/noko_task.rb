page = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2017.html"))

team_names = page.css("th[data-stat='team_name'] a").map do |team_name|
              team_name.text
            end

wins = page.css("td[data-stat='wins']").map do |win|
         win.text.to_i
       end

losses = page.css("td[data-stat='losses']").map do |loss|
        loss.text.to_i
      end

win_loss_pcts = page.css("td[data-stat='win_loss_pct']").map do |per|
                 per.text.to_f
               end

ids = (0..29).to_a

ids.each do |id|
  Standing.create(team_names[id], (wins[id]+losses[id]), wins[id], losses[id], win_loss_pcts[id]))
end
