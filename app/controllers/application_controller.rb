class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :is_super_user
    helper_method :is_logged



    def is_super_user
        return current_user.id==1 if user_signed_in?
        false
    end

    def is_logged
        user_signed_in?
    end


end
