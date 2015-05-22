require './startup'

class Hurricane
  def initialize
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/currenthurricane/view.json")
  end

  def active_hurricane
    current = @page["currenthurricane"]
    current.each do |x|
      puts "SaffirSimpsonCategory: #{x["Current"]["SaffirSimpsonCategory"]} \nURL: #{x["stormInfo"]["wuiurl"]}"
    end
  end
end
