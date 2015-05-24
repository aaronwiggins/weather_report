require './startup'

class ConditionSummary
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/conditions/q/#{zip}.json")#get_data
  end

  def get_weather_info
    temp = @page["current_observation"]["temp_f"]
    feels_like = @page["current_observation"]["feelslike_string"]
    url = @page["current_observation"]["forecast_url"]
    "The temperature is #{temp}, it feels like #{feels_like}. \nVisit #{url} for more details."
  end
end
