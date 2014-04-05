class Tag < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  has_many :workouts, :through => :exercises
  
  after_save :slugger

  private

    def slugger
      self.slug = self.name.parameterize
      self.update_column(:slug, self.slug)
    end

end
