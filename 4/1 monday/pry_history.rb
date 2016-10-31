require 'net/http'
Net::HTTP.get('www.google.com', '/index.html')
exit
response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
require 'httparty'
response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
exit
w = Weather.new.get(39.2659259,-77.6989605)
w.class
ls w
w
w["latitude"]
w["currently"]["summary"]
exit!
Weather.new.get(39.2659259,-77.6989605)
exit
Weather.new.get(39.2659259,-77.6989605)
w = _
w.class
exit!
Weather.new.get(39.2659259,-77.6989605)
w = _
w.body
ls
ls w
w.parsed_response
w.parsed_response.class
Time.now.to_i
3.days.ago
exit
3.days.ago
exit
3.days.ago
(3.days.ago).to_i
[1,2,3,4].sum
exit!
Weather.new.at(39.2659259,-77.6989605, 3.days.ago.to_i)
exit!
Weather.new.at(39.2659259,-77.6989605, 3.days.ago.to_i)
exit
ENV
ENV["EDITOR"]
ENV
exit
