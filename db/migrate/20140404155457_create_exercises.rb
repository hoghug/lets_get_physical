class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
    end
    create_table :exercises_tags do |t|
      t.belongs_to :exercise
      t.belongs_to :tag
    end
    create_table :tags do |t|
      t.string :name
    end
    create_table :exercises_workouts do |t|
      t.integer :number
      t.belongs_to :exercise
      t.belongs_to :workout
    end
    create_table :workouts do |t|
      t.string :name
    end
  end
end
