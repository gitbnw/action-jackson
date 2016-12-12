class SquareBroadcastJob < ApplicationJob
  queue_as :default

  def perform(square, squares)
    ActionCable.server.broadcast "game_#{square.game.id}_channel",
                                      squares: squares.to_a,
                                      user: User.find(square.user),
                                      game: Game.find(square.game)
    end

  private

  # def render_squares(square)
  #   @game = Game.find(square.game.id)
  #   SquaresController.render partial: 'squares/square', locals: {game: @game, square: square}
  # end
end
