class Game < ApplicationRecord
  has_many :squares
  has_many :seats
  has_many :users, through: :seats    
end