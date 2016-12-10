class AddGameRefToSeats < ActiveRecord::Migration[5.0]
  def change
    add_reference :seats, :game, foreign_key: true
  end
end
