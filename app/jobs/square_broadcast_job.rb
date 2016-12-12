class SquareBroadcastJob < ApplicationJob
  queue_as :default

  def perform(square)
    ActionCable.server.broadcast "chat_rooms_#{square.game.id}_channel",
                                      square: render_square(square)
  end

  private

  def render_square(square)
    SquaresController.render 'games/show'
  end
end
