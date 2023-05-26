class TrainingController < ApplicationController
  before_action :authenticate_user!
  before_action :show, only: [:create]

  layout false

  def show    
    @user = get_current_logged_in_user
    @pumpups = @user.pumpups
    @fileDF = generatePDF
  end

  def generatePDF
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new

        pdf.font_families["pdfFont"] = {
          normal: "#{Rails.root}/app/assets/fonts/CaviarDreams.ttf"
        }

        pdf.font "pdfFont"

        pdf.text "WYKONANA ILOŚĆ SERII I POWTÓRZEŃ POMPKÓW WZGLĘDEM DATY", size: 20, align: :center
        pdf.move_down 30
  
        pdfDate = []
        pdfDate << ["SERIA", "POWTÓRZENIA", "DATA"]

        @pumpups.each do |pumpup|
          pdfDate << [pumpup.series, pumpup.rep, pumpup.date]
        end
       
        pdf.table(pdfDate, header: true, cell_style: { border_width: 0.7, padding_left: 50, padding_right: 50, align: :center}, position: :center)
        pdf.number_pages "STRONA <page>", at: [pdf.bounds.right - 70, pdf.bounds.bottom]

        send_data pdf.render, type: "application/pdf", disposition: "inline"
      end
    end
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
