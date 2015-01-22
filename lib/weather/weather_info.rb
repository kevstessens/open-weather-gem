class WeatherInfo
  def initialize(temp, humidity, pressure, temp_min, temp_max, unit,general_state,general_description)
    @temp=temp
    @unit=unit
    @humidity=humidity
    @pressure = pressure
    @temp_min = temp_min
    @temp_max = temp_max
    @general_state = general_state
    @general_description = general_description
  end

  def temp
    @temp
  end

  def general_state
    @general_state
  end

  def general_description
    @general_description
  end

  def unit
    @unit
  end

  def humidiy
    @humidity
  end

  def pressure
    @pressure
  end

  def temp_min
    @temp_min
  end

  def temp_max
    @temp_max
  end

  def method_missing(m, *args, &block)
    "There's no method called #{m}."
  end

end
