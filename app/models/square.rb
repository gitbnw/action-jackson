class Square < ApplicationRecord
    belongs_to :game
    scope :available, -> { where(status: "open") }
    
    def self.create_board game_id
        9.times do |i|
            @square = Square.create(game_id: game_id, position: i + 1)
        end
    end
    
end
