class ReportsController < ApplicationController
  # before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :user_active, if: :signed_in?

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
    invoice_status_id = params[:invoice_status_id]
    invoices = Invoice.where('DATE(created_at) >= ? and DATE(created_at) <= ? and invoice_status_id = ?', start_date, end_date, invoice_status_id)

    if start_date.present? && end_date.present?

      if invoices.size > 0
        report = InvoiceReportService.new.report_invoice_per_date(start_date, end_date, invoice_status_id, invoices)
        send_data report.generate, type: 'application/vnd.oasis.opendocument.text', disposition: 'attachment', filename: "report_invoice_#{Time.now.strftime("%Y%m%d%H%M%S")}.odt"
      else
        respond_to do |format|
          format.html { redirect_to reports_path, notice: 'No data for this report' }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to reports_path, notice: 'The dates are invalid'  }
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
