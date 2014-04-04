class Workout < ActiveRecord::Base
  has_many :movements
  has_many :exercises, :through => :movements

  after_save :slugger

  private

    def slugger
      self.slug = self.name.parameterize
      self.update_column(:slug, self.slug)
    end

end
