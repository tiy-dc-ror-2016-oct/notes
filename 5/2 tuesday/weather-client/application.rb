require './wu_api'
require './alerts'
require './astronomy'
require './conditions'
require './ten_day_forecast'
require 'pry'

class WeatherApp
  def get_zip
    gets.chomp
  end

  def run!

      puts "Please enter your desired zip code"
      zip_code = get_zip

      conditions = Conditions.new(zip_code)
      alerts = Alerts.new(zip_code).data
      astronomy = Astronomy.new.get(zip_code)
      ten_day_forecast = TenDayForecast.new.get(zip_code)

      puts "You chose: #{conditions.location}"
      puts "="*20
      puts "Current condition: #{conditions.weather}"
      puts "Temperature(F): #{conditions.temp_f}"
      puts "Wind MPH: #{conditions.wind_speed}"
      puts "Wind direction: #{conditions.wind_direction}"
      puts "="*20
      puts "Ten day forecast:"
        ten_day_forecast['forecast']['txt_forecast']['forecastday'].each do |el|
        p el['title'] + ": " + el['fcttext']
        end
      puts "="*20
      puts "Sunrise: #{astronomy['moon_phase']['sunrise']['hour']}:#{astronomy['moon_phase']['sunrise']['minute']}"
      puts "Sunset: #{astronomy['moon_phase']['sunset']['hour']}:#{astronomy['moon_phase']['sunset']['minute']}"
      puts "="*20
      puts "Current weather alerts:"
        alerts['alerts'].each do |el|
        p el['description']
        end
  end
end

WeatherApp.new.run! if __FILE__ == $PROGRAM_NAME
