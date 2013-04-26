module MadChatter
  class ApplicationController < ActionController::Base

    def require_authenticated_user
      unless current_user.present?
        redirect_to mad_chatter.auth_login_path
      end
    end

    def current_user
      if id = session[:user_id]
        User.find(id)
      end
    end

  end
end
