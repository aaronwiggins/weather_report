require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './startup'
require 'json'

class TenDayForecast
  private def get_data
    @page = JSON.parse(File.open("ten_day_forecast.json").read)
  end
end

class SunRiseSet
  private def get_data
    @page = JSON.parse(File.open("sun_rise_and_set.json").read)
  end
end

class WeatherAlert
  private def get_data
    @page = JSON.parse(File.open("weather_alert.json").read)
  end
end

class Hurricane
  private def get_data
    @page = JSON.parse(File.open("hurricane.json").read)
  end
end

class ConditionSummary
  private def get_data
    @page = JSON.parse(File.open("condition_summary.json").read)
  end
end


class WeatherReport < MiniTest::Test
  def test_can_get_site_info
    area = ConditionSummary.new(27513)
    p area.zip
    assert_equal "#{area.zip}", area.page["current_observation"]["display_location"]["zip"]
  end

  # def test_ten_day_forecast
  #   report = TenDayForecast.new(27513)
  #   puts "On " + "#{report.get_day} " "#{report.get_forecast}"
  #   # assert_equal 21, report.ten_day_forecast
  # end
  #
  # def test_get_sunrise_sunset_time
  #   sun_one = SunRiseSet.new(27513)
  #   assert_equal true, sun_one.sun_time("sunrise").scan(/\d?\d\:\d{2}/) ? true : false
  # end

  # def test_get_weather_alerts
  #   # 73542 alert in the area right now 5/22/15 9:40
  #   check_weather = WeatherAlert.new(27513)
  #   p check_weather.get_alert?
  #   assert true, check_weather.get_alert?
  # end

  # def test_list_actve_hurricanes
  #   storm = Hurricane.new
  #   storm.active_hurricane
  # end
end
