class Workout < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  # has_many :tags, :through => :exercises
end