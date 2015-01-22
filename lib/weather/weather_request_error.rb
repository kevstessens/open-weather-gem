class WeatherRequestError

  def initialize(error_code)
    @error_code=error_code
  end

  def error_code
    @error_code
  end

  def method_missing(m, *args, &block)
    "There has been a "+ @error_code +" error"
  end

end
