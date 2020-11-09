class ApplicationController < ActionController::Base
    helper_method :is_super_user

    def is_super_user
        return current_user.id==1 if user_signed_in?
        false
    end

end
