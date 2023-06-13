class RankingController < ApplicationController
  before_action :authenticate_user!

  layout false

  def show
      @user = get_current_logged_in_user
      @top5 = find_top5
      @top4 = find_top4
      @top3 = find_top3
      @top5_with_rep = find_top5_with_rep
  end

  private

  def find_top5_with_rep
    User.joins(:pumpups).where(pumpups: { date: Time.now.beginning_of_week..Time.now.end_of_week }).group('users.id').order('SUM(pumpups.rep) DESC').limit(5)
  end

  def find_top5
    User.joins(:pumpups).where(pumpups: { date: Time.now.beginning_of_week..Time.now.end_of_week }).select('users.*, SUM(pumpups.series * pumpups.rep) AS result').group('users.id').order('result DESC').limit(5)
  end

  def find_top4
    User.joins(:pumpups).group('users.id').order('SUM(pumpups.series) DESC').limit(4)
  end

  def find_top3
    User.joins(:pumpups).where(pumpups: { date: Time.now.beginning_of_month..Time.now.end_of_month }).group('users.id').order('COUNT(pumpups.id) DESC').limit(3)
  end

  def get_current_logged_in_user
      user_id = current_user.id
      User.find_by(id: user_id)
  end
end