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
end
