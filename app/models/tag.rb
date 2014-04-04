class Tag < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  # has_many :workouts, :through => :exercises
end
