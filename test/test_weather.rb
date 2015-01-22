require 'minitest/autorun'
require 'weather'

class WeatherTest < Minitest::Test

  def test_error_code
    error_code = WeatherRequestError.new("test")

    #Testing error code

    assert_equal "test",
                 error_code.error_code

    assert_equal "404",
                 Weather.get_weather_by_city_name('egjegejerjigreijgjiergjirejigreijgerijg').error_code
    #Testing method missing for error code
    assert_equal "There has been a 404 error",
                 Weather.get_weather_by_city_name('egjegejerjigreijgjiergjirejigreijgerijg').pepe

    assert_equal "There has been a test error",
                 error_code.testing_method_missing_now
  end

  def test_weather_info
    weather_info = WeatherInfo.new("1", "2", "3", "4", "5", "metric", "Cloudy", "is Cloudy")

    assert_equal "1",
                 weather_info.temp
    assert_equal "2",
                 weather_info.humidiy
    assert_equal "3",
                 weather_info.pressure
    assert_equal "4",
                 weather_info.temp_min
    assert_equal "5",
                 weather_info.temp_max
    assert_equal "metric",
                 weather_info.unit
    assert_equal "Cloudy",
                 weather_info.general_state
    assert_equal "is Cloudy",
                 weather_info.general_description
    #Testing method missing
    assert_equal "There's no method called pepe.",
                weather_info.pepe
  end

  def test_weather_by_city_name
    #Testing data unit selection
    assert_equal "imperial",
                 Weather.get_weather_by_city_name('London').unit
    assert_equal "imperial",
                 Weather.get_weather_by_city_name('London', 'imperial').unit
    assert_equal "metric",
                 Weather.get_weather_by_city_name('London','metric').unit
    assert_equal "imperial",
                 Weather.get_weather_by_city_name('London').unit
  end

  def test_weather_by_city_id
    #Testing data unit selection
    assert_equal "imperial",
                 Weather.get_weather_by_city_id('524901').unit
    assert_equal "imperial",
                 Weather.get_weather_by_city_id('524901','imperial').unit
    assert_equal "metric",
                 Weather.get_weather_by_city_id('524901','metric').unit
  end

  def test_weather_by_lat_long
    #Testing data unit selection
    assert_equal "imperial",
                 Weather.get_weather_by_lat_long('30').unit
    assert_equal "imperial",
                 Weather.get_weather_by_lat_long('30','metric').unit
    assert_equal "imperial",
                 Weather.get_weather_by_lat_long('30','50').unit
    assert_equal "metric",
                 Weather.get_weather_by_lat_long('30','50','metric').unit
  end
end