require './startup'

class TenDayForecast
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/forecast10day/q/#{zip}.json")
  end

  def get_day
    count = 0
    forecast = ""
    while count < 20
      day = @page["forecast"]["txt_forecast"]["forecastday"][count]["title"]
      weather = @page["forecast"]["txt_forecast"]["forecastday"][count]["fcttext"]
      count += 2
      forecast += "On #{day} expect #{weather}\n"
    end
    forecast
  end
end
