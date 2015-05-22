require './startup'

class WeatherAlert
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/alerts/q/#{zip}.json")
  end

  def get_alert?
    alert = @page["alerts"][0]
    alert["description"]
    alert["expires"]
  end
end
