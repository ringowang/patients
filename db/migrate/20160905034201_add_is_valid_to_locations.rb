class AddIsValidToLocations < ActiveRecord::Migration
    def change
      add_column :location, :is_valid, :boolean, default:1
    end
end
