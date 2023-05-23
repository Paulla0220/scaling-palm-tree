class ChartController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = get_current_logged_in_user
        @pumpups = @user.pumpups
        @chartRep = getChartRep
        @chartSeries = getChartSeries
        @chartDate = getChartDate
    end

    private

    def getChartRep
        @pumpups.order(date: :asc).pluck(:date, :rep).map { |date, value| [date.strftime("%d.%m.%Y"), value] }
    end

    def getChartSeries
        @pumpups.order(date: :asc).pluck(:date, :series).map { |date, value| [date.strftime("%d.%m.%Y"), value] }
    end

    def getChartDate
        multiply = @pumpups.order(date: :asc).pluck(:date, :rep, :series).map { |date, value1, value2| [date, value1 * value2] }
        getDate = multiply.map { |date, value| [date.strftime("%d.%m.%Y"), value] }
    end

    def get_current_logged_in_user
        user_id = current_user.id
        User.find_by(id: user_id)
    end

end
