class AddVideo < ActiveRecord::Migration
  def change
    add_column :exercises, :video, :string
  end
end
