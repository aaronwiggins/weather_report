require './startup'
loop do
  puts "What zip code would you like to search for weather details? Press enter\nto exit"
  input = gets.chomp
  if input.empty?
    exit
  elsif input.length != 5
    puts "Try again, a zip code has five digits."
    next
  else
    current_weather = ConditionSummary.new(input)
    puts current_weather.get_weather_info
    future_forecast = TenDayForecast.new(input)
    puts future_forecast.get_day
    weather_warnings = WeatherAlert.new(input)
    puts weather_warnings.get_alert
    hurricane = Hurricane.new
    puts hurricane.active_hurricane
    puts "Would you like to see sunrise or sunset?"
    response = gets.chomp
    if response.empty?
      next
    else
      rise_set_time = SunRiseSet.new(input)
      puts rise_set_time.sun_time(response)
    end
  end
end
