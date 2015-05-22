require './startup'

class TenDayForecast
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/forecast10day/q/#{zip}.json")
  end

  def get_fahrenheit
    @page["current_observation"]["temp_f"]
  end

  # def ten_day_forecast
  #   @page["forecast"]["simpleforecast"]["forecastday"]["high"]
  # end
end
