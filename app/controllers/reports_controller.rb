class ReportsController < ApplicationController
  # before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @start_date = nil
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create

  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update

  end

  def invoice_report_per_date
    start_date = params[:invoices_start_date].to_date
    end_date = params[:invoices_end_date].to_date
    respond_to do |format|
      if start_date >= end_date
        InvoiceReportService.new().report_test(start_date, end_date, 1)
        format.html { redirect_to reports_path, notice: 'Report Created! ' }
      else
        format.html { redirect_to reports_path, notice: 'Start date must be less ' }
      end
    end
  end


  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
  end
end
