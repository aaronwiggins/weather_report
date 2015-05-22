require './startup'

class Hurricane
  def initialize
    @page = get_data
  end

  def active_hurricane
    current = @page["currenthurricane"]
    current.each do |x|
      puts "SaffirSimpsonCategory: #{x["Current"]["SaffirSimpsonCategory"]} \nURL: #{x["stormInfo"]["wuiurl"]}"
    end
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/currenthurricane/view.json")
  end
end
