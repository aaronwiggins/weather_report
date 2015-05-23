#http://api.wunderground.com/api/3481b3bd85f62458/features/settings/q/query.format
require './startup'

class ConditionSummary
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = get_data
  end

  def get_weather_info
    temp = @page["current_observation"]["temp_f"]
    feels_like = @page["current_observation"]["feelslike_string"]
    url = @page["current_observation"]["forecast_url"]
    "The temperature is #{temp}, it feels like #{feels_like}. \nVisit #{url} for more details."
  end
end
