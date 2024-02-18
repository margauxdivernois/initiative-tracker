class CreateCharacterFights < ActiveRecord::Migration[7.1]
  def change
    create_table :character_fights do |t|
      t.references :character, null: false, foreign_key: true
      t.references :fight, null: false, foreign_key: true
      t.integer :pv

      t.timestamps
    end
  end
end
