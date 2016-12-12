class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
  
  def index
    @games = Game.all
    @games_with_one_player = Game.joins( :users ).group( 'game_id' ).having( 'count( game_id ) = 1' )
    
  end
  
  def show
      @game = Game.find(params[:id])
      @squares = @game.squares
  end  
  
  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to games_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end 
    
end
