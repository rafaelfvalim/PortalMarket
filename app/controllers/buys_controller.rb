class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  before_action :user_active, if: :signed_in?
  # GET /buys
  # GET /buys.json
  def index
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
  end

  def show_product
    @script = Script.find_by id: params[:id]
    @id_search = params[:id_search] #SearchJoy Analitics
    @price = Price.find_by_script_id(@script.id)
    @cart = Cart.new
    @cart.workplace = Workplace.new

    gon.script_id = @script.id
    gon.price_id = @price.id
    gon.member_id = current_user.member.id
    gon.pdf_file = @script.pdf_file
  end

  # GET /buys/new
  def new
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
  end

  def final
    @carts = Cart.where(id: flash[:cart_ids])
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
  end

  def autocomplete_organization
    @workplace = Workplace.where('organization_name LIKE ?', "%#{params[:term]}%")
    respond_to do |format|
      format.html
      #format.json { render json: @requirements.map(&:requirement) }
      format.json { render json: @workplace.to_json }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_buy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def buy_params
  end


end
