class AddDefaultStatusToSquares < ActiveRecord::Migration[5.0]
  def change
    change_column :squares, :status, :string, :default => "open"
  end
end
