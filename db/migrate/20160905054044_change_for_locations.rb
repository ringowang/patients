class ChangeForLocations < ActiveRecord::Migration
  def change
      add_column :locations, :is_valid, :integer, default: 1
  end
end
