class AddNameToFight < ActiveRecord::Migration[7.1]
  def change
    add_column :fights, :name, :string
  end
end
