require './startup'

class TenDayForecast
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = get_data
  end

  def get_fahrenheit
    @page["current_observation"]["temp_f"]
  end

  def get_day
    count = 0
    forecast = ""
    while count < 20
      day = @page["forecast"]["txt_forecast"]["forecastday"][count]["title"]
      weather = @page["forecast"]["txt_forecast"]["forecastday"][count]["fcttext"]
      count += 2
      forecast += "On #{day} expect #{weather}.\n"
    end
    forecast
  end
end
