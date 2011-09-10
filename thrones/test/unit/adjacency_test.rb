require 'test_helper'

class AdjacencyTest < ActiveSupport::TestCase
  test "Sunspear is adjacent to Salt Shore" do
    assert territories(:one).adjacents.include?(territories(:two))
    assert territories(:two).adjacents.include?(territories(:one))
  end

  test "Lannisport is NOT adjacent to Sunspear" do
    assert !territories(:four).adjacents.include?(territories(:one))
  end
end
