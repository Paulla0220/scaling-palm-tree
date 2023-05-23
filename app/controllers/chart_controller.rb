class ChartController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = get_current_logged_in_user
        @pumpups = @user.pumpups
        @chart = getChart
    end

    private

    def getChart
        @pumpups.pluck(:data, :rep)
    end

    def get_current_logged_in_user
        user_id = current_user.id
        User.find_by(id: user_id)
    end

end
