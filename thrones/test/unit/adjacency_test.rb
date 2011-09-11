require 'test_helper'

class AdjacencyTest < ActiveSupport::TestCase
	#
	# The method for checking territory proximity has been (to this point) to go 
	# directly north of a territory, verify that territory's adjacency, and continue 
	# clockwise around the territory (checking each adjacency as you go). -Jeff, 9/10/11
	#
	
  test "Sunspear should be adjacent to proper territories" do
	assert territories(:sunspear).adjacents.include?(territories(:sea_of_dorne)), "Sunspear is not adjacent to Sea of Dorne."
	#assert territories(:sunspear).adjacents.include?(territories(:summer_sea)), "Sunspear is not adjacent to Summer Sea."
    #assert territories(:sunspear).adjacents.include?(territories(:yronwood)), "Sunspear is not adjacent to Yronwood."
  end

  test "Yronwood should be adjacent to proper territories" do
    assert territories(:yronwood).adjacents.include?(territories(:sea_of_dorne)), "Yronwood is not adjacent to Sea of Dorne."
	#assert territories(:yronwood).adjacents.include?(territories(:sunspear)), "Yronwood is not adjacent to Sunspear."
	#assert territories(:yronwood).adjacents.include?(territories(:summer_sea)), "Yronwoodis not adjacent to Summer Sea."
	#assert territories(:yronwood).adjacents.include?(territories(:starfall)), "Yronwood is not adjacent to Redwyne Straights."
	#assert territories(:yronwood).adjacents.include?(territories(:dornish_marches)), "Yronwood is not adjacent to the Dornish Marches."
  end
end
