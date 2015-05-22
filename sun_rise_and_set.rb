require './startup'

class SunRiseSet

  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = get_data
  end

  def sun_time(type)
    hour = @page["sun_phase"][type]["hour"]
    minute = @page["sun_phase"][type]["minute"]
    "#{type} time is: #{hour}:#{minute}"
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/astronomy/q/#{zip}.json")
  end
end
