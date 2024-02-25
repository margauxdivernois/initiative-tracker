class AddInitiativeToCharacterFights < ActiveRecord::Migration[7.1]
  def change
    add_column :character_fights, :initiative, :integer
  end
end
