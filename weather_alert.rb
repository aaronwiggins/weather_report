require './startup'

class WeatherAlert
  def initialize(zip)
    @zip = zip
    @page = get_data
  end

  def get_alert?
    alert = @page["alerts"][0]
    if alert.empty == nil
      "No severe weather alerts in your area"
    else
      description = alert["description"]
      expire_time = alert["expires"]
      "Watch for #{description} in your area until #{expire_time}"
    end
  end
end
