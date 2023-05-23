class DateController < ApplicationController
    before_action :authenticate_user!
    
    layout false
    
    def show
        @user = get_current_logged_in_user
    end

    private

    def get_current_logged_in_user
        user_id = current_user.id
        User.find_by(id: user_id)
    end
end
