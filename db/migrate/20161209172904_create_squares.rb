class CreateSquares < ActiveRecord::Migration[5.0]
  def change
    create_table :squares do |t|
      t.string :status

      t.timestamps
    end
  end
end
