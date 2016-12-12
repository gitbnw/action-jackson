class GamesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @games = Game.all
        @user = current_user
        @games_with_one_player = Game.joins( :users ).group( 'game_id' ).having( 'count( game_id ) = 1' )
    end
    
    def show
        @game = Game.find(params[:id])
        @squares = @game.squares
        @players = @game.users
        respond_to do |format|
           format.html
           format.js
        end       
    end
    
    def new
        @user = current_user
        @game = Game.new(active: true, turn: @user.id)
        @game.users << @user

        if @game.save
            flash.now[:notice] = "New game begun."
            Game.where.not(id: @game.id).update_all(active: false)

            redirect_to @game
        else
           raise 
        end
    end
    
    def edit
        @game = Game.find(params[:id])
        @user = current_user
        @game.users << @user
        
        if @game.save

          redirect_to(@game)

        end
        
        
    end
    
end
