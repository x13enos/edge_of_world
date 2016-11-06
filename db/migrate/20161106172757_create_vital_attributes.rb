class CreateVitalAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :vital_attributes do |t|
      t.string :name
      t.integer :value
      t.integer :max_value
      t.integer :character_id

      t.timestamps
    end
  end
end
