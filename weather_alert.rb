require './startup'

class WeatherAlert
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/alerts/q/#{zip}.json")
  end

  def get_alert
    alert = @page["alerts"]
    if alert.empty? == true
      "No severe weather alerts in your area"
    else
      warnings = ""
      alert.each do |x|
        description = x["description"]
        expire_time = x["expires"]
        warnings << "Watch for #{description} in your area until #{expire_time}\n"
      end
      warnings
    end
  end
end
