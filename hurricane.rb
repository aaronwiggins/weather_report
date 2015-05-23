require './startup'

class Hurricane
  def initialize
    @page = get_data
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
