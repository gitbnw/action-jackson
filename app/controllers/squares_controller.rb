class SquaresController < ApplicationController
    def update
        @square = Square.find(params[:id])
        @game = Game.find(params[:game_id])
        @user = current_user
        @square.update(user: @user)
        @player_position = @game.users.to_a.index(current_user)

        if @player_position == 0
            @game.turn = @game.users[1]
        else 
            @game.turn = @game.users[0]
        end

       if @game.save
        respond_to do |format|
           format.js
        end        
       else
           raise
       end
    
    end
end
