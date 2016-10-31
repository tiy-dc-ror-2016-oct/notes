tickets[0]
first_ticket = tickets[0]
first_ticket
ls first_ticket
first_ticket["VIOLATIONDESC"]
speeding_tickets = tickets.select{ |ticket| ticket["VIOLATIONDESC"].match(/OVER THE SPEED LIMIT/)}
speeding_tickets.last
speeding_tickets.size
speeding_violation_desc = speeding_tickets.map { |el| el["VIOLATIONDESC"]} 
speeding_violation_desc.uniq
speeding_violation_desc.uniq.last
desc = "SPEED 21-25 MPH OVER THE SPEED LIMIT"
desc
desc.match(\d)
desc.match(/\d/)
desc.match(/\d+/)
desc.scan(/\d+/)
desc.scan(/\d+/).last
desc.scan(/\d+/).last.to_i
speeds = speeding_violation_desc.map { |el| el.scan(/\d+/).last.to_i}
total_speed = 0
speeds.each do |el|
  total_speed += el
end 
total_speed
sum_totals_speeds = speeds.reduce {|acc, el| acc + el }
ls Array
Array.ancestors
ls Array
Array.ancestors
ls Hash
ls []
sum_totals_speeds = speeds.inject(0) {|acc, el| acc + el }
sum_totals_speeds = speeds.inject(:+)
sum_totals_speeds = speeds.reduce(:+)
1197415.methods
exit
234+234+123
+1234
234+234+123+1234
1825+60
