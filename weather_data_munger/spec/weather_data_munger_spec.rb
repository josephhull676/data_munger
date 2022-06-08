require_relative '../weather_data_munger'
require "test/unit/assertions"

include Test::Unit::Assertions

WEATHER_DATA = File.open("./weather_data_munger/weather.dat", File::RDONLY) { |f| f.read }

def test_month
  weather_data_munger = WeatherDataMunger.new(WEATHER_DATA)

  assert_equal(2, weather_data_munger.smallest_temperature_spread)
end

test_month
