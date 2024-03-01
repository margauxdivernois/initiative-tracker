class AddTypeAndCountableToCharacter < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :character_type, :integer, :default => 0
    add_column :characters, :countable, :boolean, :default => false
  end
end
