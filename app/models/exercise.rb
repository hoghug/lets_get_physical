class Exercise < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :movements
  has_many :workouts, :through => :movements

  after_save :slugger

  private

    def slugger
      self.slug = self.name.parameterize
      self.update_column(:slug, self.slug)
    end


end
