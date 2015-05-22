require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './startup'


class WeatherReport < MiniTest::Test
  # def test_true
  #   assert true
  # end

  # def test_can_get_site_info
  #   area = ConditionSummary.new(27513)
  #   assert_equal "#{area.zip}", area.page["current_observation"]["display_location"]["zip"]
  # end
  #
  # def test_ten_day_forecast
  #   report = TenDayForecast.new(27513)
  #   p report.ten_day_forecast
  #   assert_equal 21, report.ten_day_forecast
  # end
  #
  # def test_get_sunrise_sunset_time
  #   sun_one = SunRiseSet.new(27513)
  #   assert true, sun_one.sun_time("sunrise").scan(/\d?\d\:\d{2}/) ? true : false
  # end

  # def test_get_weather_alerts
  #   check_weather = WeatherAlert.new(73542)
  #   p check_weather.get_alert?
  #   assert true, check_weather.get_alert?
  #   #find description & expires
  # end
end
