# Weather gem for Altoros by Kevin Stessens

This gem allows to get data from OpenWeather API.

## Installation

Add this line to your application's Gemfile:

	gem 'weather', github: 'kevstessens/weather'

And then execute:

    $ bundle install

## Response object

It returns a Response object, with:
	    - temp
	    - humidity
	    - pressure
	    - temp_min
	    - temp_max
	    - unit
	    - general_state
	    - general_description
Or, if there is an error:
	    - error_code
## Usage

###Getting info by city name

	Weather.get_weather_by_city_name("London","metric")
	Weather.get_weather_by_city_name("London","imperial")
	Weather.get_weather_by_city_name("London")

###Getting info by city id

	Weather.get_weather_by_city_id("524901","metric")
	Weather.get_weather_by_city_id("524901","imperial")
	Weather.get_weather_by_city_id("524901")

###Getting info by latitude and longitude

    Weather.get_weather_by_city_lat_long("30")
    Weather.get_weather_by_city_lat_long("30","54")
    Weather.get_weather_by_city_lat_long("30","metric")
    Weather.get_weather_by_city_lat_long("30","imperial")
    Weather.get_weather_by_city_lat_long("30","54","imperial")

####example
    response = 	Weather.get_weather_by_city_name("London")
    response.general_state => Returns the general state as string (i.e: "Cloudy")
    response.general_description => Returns the general description as string (i.e: "Few clouds")
    response.temp => Returns the temperature
    response.humidity => Returns the humidity
    response.pressure => Returns the pressure
    response.temp_min => Returns the minimum temperature
    response.temp_max => Returns the maximum temperature
    response.unit => Returns the meassure unit

## Details

Created by Kevin Stessens for Altoros