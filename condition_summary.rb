#http://api.wunderground.com/api/3481b3bd85f62458/features/settings/q/query.format
require './startup'

class ConditionSummary
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/conditions/q/#{zip}.json")
  end

  def get_fahrenheit
    @page["current_observation"]["temp_f"]
  end
end
