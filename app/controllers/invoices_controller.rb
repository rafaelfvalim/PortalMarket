class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :resend_invoice]
  before_action :user_active, if: :signed_in?

  # GET /invoices
  # GET /invoices.json
  def index
    if current_user.is_god?
      @invoices = Invoice.all
    else
      render_404
    end
  end

  def invoices_ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: InvoiceDatatable.new(view_context) }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoices ||= Array.new
    @cart_ids = params[:cart]
    @carts = Cart.where(id: @cart_ids)
    invoice_service = InvoiceService.new
    checkig_accoutn_service = CheckingAccountService.new
    license_service = LicenseService.new
    @carts.each do |cart|
      @invoice = Invoice.new
      @checking_account = CheckingAccount.new
      @invoice.attributes = {user_id: current_user.id, script_id: cart.script_id, value: cart.price.value, invoice_status_id: 1, script_file: invoice_service.generate_invoice_script_file(current_user, cart.script), notes: '', pay_date: nil, ship_date: nil, shipped_to: current_user.email, shipped_via: 'email', pay_method_id: 1, workplace_id: cart.workplace_id}
      @invoices.push(@invoice)
      cart.update_attribute(:full_sale, true)
    end
    respond_to do |format|
      if @invoices.each(&:save)
        @invoices.each do |i|
          invoice_service.create_download_file(i)
          invoice_service.send_invoice(i.user_id, i)
          checkig_accoutn_service.initialize_checking_account(i)
          license_service.initialize_license(i)
        end
        flash[:cart_ids] = @cart_ids
        format.html { redirect_to final_buys_path }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def download
    invoice_service = InvoiceService.new
    invoice_id = invoice_service.url_get_invoice_id(current_user.id, params[:url])
    unless invoice_id.nil?
      invoice = Invoice.find(invoice_id)
      send_file "#{Rails.public_path}#{invoice.invoice_script_url}", :disposition => 'attachment'
    else
      respond_to do |format|
        format.html { render :download }
      end
    end
  end

  def resend_invoice
    message = InvoiceService::send_invoice(@invoice.user_id, @invoice.script)
    respond_to do |format|
      format.html { redirect_to invoice_orchestration_invoices_path(invoice_status_id: @invoice.invoice_status_id), notice: message }
    end
  end


  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def process_orchestration
    @invoice_status_id = params[:invoice_status][:id]
    current_status = params[:current_status]
    invoices = Invoice.where(id: params[:invoices_ids])
    @invoices = Invoice.where(:invoice_status_id => current_status).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')

    respond_to do |format|
      if @invoice_status_id.nil?
        format.js { render "form_invoice_orchestration" }
      elsif invoices.map { |i| i.update_attribute(:invoice_status_id, @invoice_status_id) }
        format.js { render "form_invoice_orchestration" }
        format.html {}
      end
    end

  end

  def invoice_orchestration
    @invoices = Invoice.where(:invoice_status_id => params[:invoice_status_id]).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
    @invoice_status = InvoiceStatus.find(params[:invoice_status_id])
    @invoice_statuses = InvoiceStatus.where('id != ?', params[:invoice_status_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(:id, :user_id, :script_id, :value, :invoice_status_id, :notes, :pay_date, :ship_date, :shipped_to, :shipped_via, :workplace_id)
  end

end
