class AddTurnToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :turn, :integer, index: true
  end
end
    