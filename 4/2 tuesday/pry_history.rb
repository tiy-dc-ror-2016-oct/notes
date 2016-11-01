exit
ls
params
e
exit!
params
ls
ri content_type
exit
require 'httparty'
10.times do 
  HTTParty.post("http://10.1.10.105:4567/speak?msg=#{rand}", "")
end
10.times do 
  HTTParty.post("http://10.1.10.105:4567/speak?msg=#{rand}", {})
end
params
exit
10.times do exit
exit
params
ls
body
request
ls request
request.body
a = request.body.read
JSON.parse(a)
request.body.read
{a: 1} + {b: 2}
{a: 1} << {b: 2}
ls {}
exit
a = _
a
exit!
response
exit!
