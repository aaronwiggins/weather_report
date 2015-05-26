#Description
Using multiple Weather Underground API endpoints, create a ruby program that will display a weather report based on a zip code entered by the user. Create a class for each API endpoint.

The program will display information concerning the current conditions, a ten-day forecast, any weather alerts in the area, details concerning any developing or current hurricanes, and the sunrise or sunset time.

While creating this program, use TDD (Test Driven Development).

##To Run...
Clone [repository](https://github.com/aaronwiggins/weather_report)

Run `ruby weather_program.rb` in bash

You'll need get get your own key from Weather Underground, follow the instructions in the link below. Sub your key for `#{ENV["WU_KEY"]}` which is in the initialize for each class file.

###Additional Info
For more information on the Weather Underground API, click [here](http://www.wunderground.com/weather/api/d/docs?MR=1)
