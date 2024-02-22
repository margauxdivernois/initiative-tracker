class AddCurrentPlayerToFight < ActiveRecord::Migration[7.1]
  def change
    add_reference :fights, :current_player, null: true, foreign_key: { to_table: :characters }
  end
end
