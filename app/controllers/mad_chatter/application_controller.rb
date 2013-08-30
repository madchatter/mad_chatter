module MadChatter
  class ApplicationController < ActionController::Base

    def require_authenticated_user
      unless user_signed_in?
        redirect_to mad_chatter.auth_login_path
      end
    end

  end
end
