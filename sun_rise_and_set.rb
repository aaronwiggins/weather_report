require './startup'

class SunRiseSet
  
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/astronomy/q/#{zip}.json")
  end

  def sunrise_time
    rise_hour = @page["sun_phase"]["sunrise"]["hour"]
    rise_minute = @page["sun_phase"]["sunrise"]["minute"]
    "Sunrise time is: #{rise_hour}:#{rise_minute}"
  end

  def sunset_time
    set_hour = @page["sun_phase"]["sunset"]["hour"]
    set_minute = @page["sun_phase"]["sunset"]["minute"]
    "Sunset time is: #{set_hour}:#{set_minute}"
  end
end
