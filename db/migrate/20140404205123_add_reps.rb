class AddReps < ActiveRecord::Migration
  def change
    add_column :exercises_workouts, :reps, :integer
  end
end
