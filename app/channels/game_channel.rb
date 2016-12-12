# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def take_square(data)
    # process data sent from the page
    square = Square.find(data['square'])
    square.update(user: current_user)
  end 
  
  def render_squares(data)
    
  end

end
