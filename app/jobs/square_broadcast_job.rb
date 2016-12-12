class SquareBroadcastJob < ApplicationJob
  queue_as :default

  def perform(square)
    ActionCable.server.broadcast "game_#{square.game.id}_channel",
                                      square: square,
                                      user: User.find(square.user)
    end

  private

  # def render_squares(square)
  #   @game = Game.find(square.game.id)
  #   SquaresController.render partial: 'squares/square', locals: {game: @game, square: square}
  # end
end
