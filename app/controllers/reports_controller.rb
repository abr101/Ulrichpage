class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end
  def recapcha_submit
    @post_ad_id = params[:id]
    @user_id = params[:user_id]
    
  end

  # POST /reports or /reports.json
  def create
    if verify_recaptcha
      @report = Report.new(report_params)

    if !Report.where(post_ad_id: @report.post_ad_id, user_id: current_user.id).exists?
    respond_to do |format|
      if @report.save
        format.html { redirect_to dashboard_contact_us_path, notice: "You have reported this Ad and admin notified. Thanks" }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to post_ad_path(id: @report.post_ad_id), alert:"You have already reported to this Ad!"
  end

    else
      redirect_to request.referer
    end
    
  end


  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report, notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.permit(:user_id, :post_ad_id, :status)
    end
end
