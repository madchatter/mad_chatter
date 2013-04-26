require_dependency "mad_chatter/application_controller"

module MadChatter
  class SessionsController < ApplicationController

    layout 'mad_chatter/unauthenticated'

    before_filter :require_authenticated_user, only: :destroy

    def new
      # display login form
    end
  
    def create
      respond_to do |format|
        if user = User.authenticate(params[:username], params[:password])
          session[:user_id] = user.id
          format.html { redirect_to mad_chatter.root_path }
          format.json { render :nothing, status: :ok, location: mad_chatter.root_path }
        else
          flash[:notice] = error_message = 'Invalid username or password.'
          format.html { render action: "new" }
          format.json { render json: { message: error_message }, status: :unauthorized }
        end
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to mad_chatter.auth_login_path
    end
  end
end
