# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:game_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def take_square(data)
    # process data sent from the page
    square = Square.find(data['square'])
    square.update(user: current_user, status: "owned by #{current_user.name}")
    game = Game.find(square.game)
    game.users.delete[current_user]
    other_user = game.users[0]
    game.update(turn: other_user)
  end 

  
end
