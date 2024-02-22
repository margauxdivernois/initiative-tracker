class AddTurnCountToFight < ActiveRecord::Migration[7.1]
  def change
    add_column :fights, :turn_count, :integer, :default => 0
  end
end
