#http://api.wunderground.com/api/3481b3bd85f62458/features/settings/q/query.format
require './startup'

class ConditionSummary
  attr_reader :zip, :page
  def initialize(zip)
    @zip = zip
    @page = get_data
  end

  def get_fahrenheit
    @page["current_observation"]["temp_f"]
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WU_KEY"]}/conditions/q/#{zip}.json")
  end
end
