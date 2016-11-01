class WuApi
  attr_reader :zip_code, :data

  BASE_URI = "http://api.wunderground.com/api/#{ENV['WU_API_KEY']}/"

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def data
    @_data ||=  HTTParty.get("#{BASE_URI}#{feature}/q/#{zip_code}.json")
  end

  def feature
    raise "Subclasses of WuAPI must define a feature method!"
  end
end
