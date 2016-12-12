class Game < ApplicationRecord
  has_many :squares, autosave: true, dependent: :destroy
  has_many :players
  has_many :users, through: :players

  after_create do |game|
    9.times {|index| Square.create!(game_id: game.id, position: index + 1)}
  end

end