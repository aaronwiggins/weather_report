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
end
