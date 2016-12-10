class AddPositionToSquares < ActiveRecord::Migration[5.0]
  def change
    add_column :squares, :position, :integer
  end
end
