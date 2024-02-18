class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :details
      t.integer :pv
      t.integer :ac
      t.string :url

      t.timestamps
    end
  end
end
