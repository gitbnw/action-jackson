class AddUserRefToSquares < ActiveRecord::Migration[5.0]
  def change
    add_reference :squares, :user, foreign_key: true
  end
end
