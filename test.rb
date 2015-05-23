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
    assert_equal true, area.get_weather_info.match("71.1") ? true : false
  end

  def test_ten_day_forecast
    report = TenDayForecast.new(27513)
    assert_equal 10, report.get_day.lines.count
  end

  def test_get_sunrise_sunset_time
    sun_one = SunRiseSet.new(27513)
    assert_equal true, sun_one.sun_time("sunset").scan(/\d?\d\:\d{2}/) ? true : false
  end

  def test_get_weather_alerts
    check_weather = WeatherAlert.new(27513)
    check_weather.get_alert
    assert_equal true, check_weather.get_alert.match("Flood Warning") ? true : false
  end

  def test_list_actve_hurricanes
    storm = Hurricane.new
    assert_equal true, storm.active_hurricane.include?("30")
  end
end
