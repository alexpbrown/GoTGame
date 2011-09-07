class Territory < ActiveRecord::Base
  has_many :territory_adjacencies
  has_many :other_territories, :through => :territory_adjacencies
  
  def neighbors
    other_territories
  end
end
