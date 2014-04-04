class AddSlug < ActiveRecord::Migration
  def change
    add_column :exercises, :slug, :string
    add_column :tags, :slug, :string
    add_column :workouts, :slug, :string
  end
end
