require_relative "../data_munger/data_munger"

class FootballDataMunger < DataMunger
  def initialize(data)
    super
  end

  def club_with_smallest_goal_difference
    goals_data.min_by do |club| 
      (club[:goals_for] - club[:goals_against]).abs
    end[:club_name]
  end

  def club_with_lowest_goal_difference
    goals_data.min_by do |club| 
      club[:goals_for] - club[:goals_against]
    end[:club_name]
  end

  private

  def goals_data
    munge_data(@data).then do |data|
      data.map { |line| { club_name: line[1], goals_for: line[6], goals_against: line[7] } }
    end
  end
end