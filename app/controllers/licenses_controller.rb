class LicensesController < ApplicationController
  before_action :set_license, only: [:show, :edit, :update, :destroy, :generate_key]
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?
  before_action :only_contributors, if: :signed_in?

  # GET /licenses
  # GET /licenses.json
  def index
    @licenses = License.joins(:invoice).where('invoices.user_id = ?', current_user.id).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
  end

  # GET /licenses/new
  def new
    @license = License.new
  end

  # GET /licenses/1/edit
  def edit
  end

  def get_data_ajax
    p = params
    p[:user_id] = current_user.id
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: LicenseDatatable.new(view_context, params) }
    end
  end

  def generate_key
    invoice = Invoice.find(params[:invoice_id])
    license_service = LicenseService.new
    key = license_service.create_license_key(invoice)
    respond_to do |format|
      if @license.update_attributes(license_key: key, expiration_date: 30.days.from_now)
        format.js { render 'licenses/licenses_table_form' }
      end
    end
  end

  def cancel_license
    # Envia a nota para status wating
    invoice = Invoice.find(params[:invoice_id])
    invoice.update_attributes(invoice_status_id: 5)
    # Bloqueia a conta corrente para processamento do cancelamento
    checking_account = CheckingAccount.find_by_invoice_id(params[:invoice_id])
    checking_account.desistencia!
    respond_to do |format|
      format.js { render 'licenses/licenses_table_form' }
    end
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = License.new(license_params)

    respond_to do |format|
      if @license.save
        format.html { redirect_to @license, notice: 'License was successfully created.' }
        format.json { render :show, status: :created, location: @license }
      else
        format.html { render :new }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licenses/1
  # PATCH/PUT /licenses/1.json
  def update
    respond_to do |format|
      if @license.update(license_params)
        format.html { redirect_to @license, notice: 'License was successfully updated.' }
        format.json { render :show, status: :ok, location: @license }
      else
        format.html { render :edit }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license.destroy
    respond_to do |format|
      format.html { redirect_to licenses_url, notice: 'License was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_license
    @license = License.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def license_params
    params.require(:license).permit(:invoice_id, :description, :key, :expiration_date, :valid, :obs)
  end

  def only_contributors
    unless current_user.is_customer? || current_user.is_god?
      redirect_to members_path, :alert => "Acesso negado!"
    end
  end
end
