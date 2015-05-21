require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './startup'


class WeatherReport < MiniTest::Test
  def test_true
    assert true
  end

  def test_can_get_site_info
    area = ConditionSummary.new(27513)
    p area.get_fahrenheit
    assert_equal "#{area.zip}", area.page["current_observation"]["display_location"]["zip"]
  end
end
