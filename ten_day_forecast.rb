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

  def get_day
    count = 0
    while count < 20
      day = @page["forecast"]["txt_forecast"]["forecastday"][count]["title"]
      count += 1
    end
    "#{day}"
  end

  def get_forecast
    count = 0
    while count < 20
      weather = @page["forecast"]["txt_forecast"]["forecastday"][count]["fcttext"] #make an each loop, should let me go into the array and pull out "day" & ["high"]}
      count += 1
    end
    "the weather will be: #{weather}"
  end



end
