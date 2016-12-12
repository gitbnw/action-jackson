class Square < ApplicationRecord
    belongs_to :game
    belongs_to :user
    scope :available, -> { where(status: "open") }
    after_update_commit { SquareBroadcastJob.perform_later(self, self.game.squares.to_a) }

    
end
