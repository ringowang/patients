class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.text :content
      t.integer :group_id
                        
      t.string   :gender
      t.string   :status
      t.integer  :view_count, default: 0
      t.integer  :is_valid, default: 1
      t.string   :first_name
      t.string   :middle_name
      t.string   :last_name
      t.date     :date_of_birth
      t.integer  :location_id

      t.timestamps null: false
    end
  end
end
