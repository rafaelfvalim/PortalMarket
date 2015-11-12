class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @carts = Cart.where(id: flash[:cart_ids])
    # @invoices = Invoice.all
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

    @carts.each do |cart|
      @invoice = Invoice.new
      @checking_account = CheckingAccount.new
      @invoice.attributes = {user_id: current_user.id, script_id: cart.script_id, value: cart.price.value, invoice_status_id: 1, notes: '', pay_date: nil, ship_date: nil, shipped_to: current_user.email, shipped_via: 'email', pay_method_id: 1, workplace_id: cart.workplace_id}
      @invoices.push(@invoice)
      cart.update_attribute(:full_sale, true)
      InvoiceMail.invoice_mail(current_user, Script.find(cart.script_id)).deliver_now
    end

    respond_to do |format|
      if @invoices.each(&:save)
        flash[:cart_ids] = @cart_ids
        format.html { redirect_to invoices_path }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
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
