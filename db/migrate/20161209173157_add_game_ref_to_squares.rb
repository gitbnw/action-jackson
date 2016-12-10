class AddGameRefToSquares < ActiveRecord::Migration[5.0]
  def change
    add_reference :squares, :game, foreign_key: true
  end
end
