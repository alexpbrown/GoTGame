class Territory < ActiveRecord::Base
  has_many :adjacencies
  has_many :adjacents, :through => :adjacencies
end
