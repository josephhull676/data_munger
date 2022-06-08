require_relative "../football_data_munger"
require "test/unit/assertions"

include Test::Unit::Assertions

FOOTBALL_DATA = File.open("./football_data_munger/football.dat", File::RDONLY) { |f| f.read }

def test_lowest_goal_difference
  football_data = FootballDataMunger.new(FOOTBALL_DATA)

  assert_equal("Leicester", football_data.club_with_lowest_goal_difference)
end

def test_smallest_goal_difference
  football_data = FootballDataMunger.new(FOOTBALL_DATA)

  assert_equal("Aston_Villa", football_data.club_with_smallest_goal_difference)
end

test_lowest_goal_difference
test_smallest_goal_difference
