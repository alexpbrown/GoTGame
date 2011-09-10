require 'test_helper'

class AdjacencyTest < ActiveSupport::TestCase
  test "Sunspear is adjacent to Salt Shore" do
    assert territories(:sunspear).adjacents.include?(territories(:salt_shore))
    assert territories(:salt_shore).adjacents.include?(territories(:sunspear))
  end

  test "Lannisport is NOT adjacent to Sunspear" do
    assert !territories(:lannisport).adjacents.include?(territories(:sunspear))
  end
end
