class TrainingController < ApplicationController
  before_action :authenticate_user!
  before_action :show, only: [:create]

  layout false

  def show
    @user = get_current_logged_in_user
    @pumpups = @user.pumpups
  end

  def new
    @pumpup = Pumpup.new
  end

  def create
    @pumpup = @user.pumpups.create(pumpup_params)
    if @user.save
      redirect_to training_path(@user)
    else
      flash[:error] = @pumpup.errors[:date].first if @pumpup.errors[:date].any?

      if @pumpup.errors[:series].any?
        flash[:error] += "\n" if flash[:error].present?
        flash[:error] = "" if flash[:error].nil?
        flash[:error] += @pumpup.errors[:series].first.to_s if @pumpup.errors[:series].any?
      end

      if @pumpup.errors[:rep].any?
        flash[:error] += "\n" if flash[:error].present?
        flash[:error] = "" if flash[:error].nil?
        flash[:error] += @pumpup.errors[:rep].first.to_s if @pumpup.errors[:rep].any?
      end
      redirect_to training_path(@user)
    end
  end

  private

  def get_current_logged_in_user
      user_id = current_user.id
      User.find_by(id: user_id)
  end

  def pumpup_params
    params.require(:pumpup).permit(:series, :rep, :date)
  end
end
