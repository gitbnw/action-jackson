class GamesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @games = Game.all
        @user = current_user
        @games_with_one_player = Game.joins( :seats ).group( 'game_id' ).having( 'count( game_id ) = 1' )
    end
    
    def show
        @game = Game.find(params[:id])
        @squares = @game.squares
    end
    
    def new
        @user = current_user
        @game = Game.new(user_id: @user.id, active: true)

        if @game.save
            flash.now[:notice] = "New game begun."
            Square.create_board(@game.id)
            Game.where.not(id: @game.id).update_all(active: false)
            redirect_to(@game)
        else
           raise 
        end
    end
    
    def join
        
        @game.users << @user
        
    end
    
end
