require 'net/http'
require "uri"
require "json"
require 'base64'
require 'digest'
require 'weather/weather_info'
require 'weather/weather_request_error'


module Weather
  def self.get_weather_by_city_id(*args)
    city_id = args[0].nil? ? '' : args[0].to_s
    units = args[1].nil? ? 'imperial' : args[1].to_s
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?id="+ city_id+"&units="+units)
    response_parser(uri,units)
  end

  def self.get_weather_by_lat_long(*args)
    lat = args[0].nil? ? '' : args[0].to_s
    long = args[1].nil? ? '' : args[1].to_s
    units = args[2].nil? ? 'imperial' : args[2].to_s
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?lat=" + lat +"&lon="+ long+"&units="+units)
    response_parser(uri,units)
  end

  def self.get_weather_by_city_name(*args)
    city_name = args[0].nil? ? '' : args[0].to_s
    units = args[1].nil? ? 'imperial' : args[1].to_s
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q="+ city_name+"&units="+units)
    response_parser(uri,units)
  end

  def self.response_parser(uri,unit_system)
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    if data['cod'] == 200
      WeatherInfo.new(data['main']['temp'],data['main']['humidity'],data['main']['pressure'],data['main']['temp_min'],data['main']['temp_max'],unit_system,data['weather'][0]['main'], data['weather'][0]['description'])
    else
      WeatherRequestError.new(data['cod'].to_s)
    end
  end

  def self.method_missing(m, *args, &block)
    "There's no method called #{m}."
  end

end
