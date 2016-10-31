class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
