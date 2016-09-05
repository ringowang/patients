class ChangeForLocations < ActiveRecord::Migration
  def change
      add_column :locations, :is_valid, :boolean, default: 1
  end
end
