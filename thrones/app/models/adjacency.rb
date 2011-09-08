class Adjacency < ActiveRecord::Base
  belongs_to :territory
  belongs_to :adjacent, :class_name => 'Territory'
end
