class CreatePlayers < ActiveRecord::Migration[5.0]
    create_table :players, id: false do |t|
      t.belongs_to :game, index: true
      t.belongs_to :user, index: true
    end
end