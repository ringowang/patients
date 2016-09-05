class ChangeForLocations < ActiveRecord::Migration
  def change
      add_column :locations, :is_valid, :boolean, default: true
  end
end
