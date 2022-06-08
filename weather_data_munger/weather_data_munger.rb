require_relative "../data_munger/data_munger"

class WeatherDataMunger < DataMunger
  def initialize(data)
    super
  end

  def smallest_temperature_spread
    temperature_spread_data.map{ |day| day[:max_temp] - day[:min_temp] }.min
  end

  private

  def temperature_spread_data
    munge_data(@data).then do |data|
      data.map { |line| { day: line[0], max_temp: line[1], min_temp: line[2] } }
    end
  end
end
