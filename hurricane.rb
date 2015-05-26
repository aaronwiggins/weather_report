require './startup'

class Hurricane
  def initialize
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/currenthurricane/view.json")
  end

  def active_hurricane
    current_storm_details = ""
    current = @page["currenthurricane"]
    current.each do |x|
      category = "#{x["Current"]["SaffirSimpsonCategory"]}"
      url = "#{x["stormInfo"]["wuiurl"]}"
      wind_speed = "#{x["Current"]["WindSpeed"]["Mph"]}mph"
      current_storm_details += "SaffirSimpsonCategory: #{category}. \nWindspeed: #{wind_speed}. \nFollow the link for more details: #{url}\n"
    end
    current_storm_details
  end
end
