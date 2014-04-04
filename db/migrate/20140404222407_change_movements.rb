class ChangeMovements < ActiveRecord::Migration
  def change
    rename_table :exercises_workouts, :movements
  end
end
