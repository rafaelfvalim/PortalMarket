class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :user_active, if: :signed_in?
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where('member_id = ? and full_sale = false', current_user.member.id)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    @cart.full_sale = false
    @cart.member_id = current_user.member.id
    @cart.price_id = @cart.script.price.id
    @cart.workplace.member_id = current_user.member.id

    workplace = Workplace.where('member_id = ? and organization_name = ? and system_number = ?',params[:cart][:workplace_attributes][:member_id], params[:cart][:workplace_attributes][:organization_name], params[:cart][:workplace_attributes][:system_number]).first
    unless workplace.nil?
      @cart.workplace_id = workplace.id
    end

    respond_to do |format|
      if @cart.save
        search = Searchjoy::Search.find params[:id_search]
        search.convert
        # format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.js { render "layouts/navigation_cart" }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    @carts = Cart.where('member_id = ? and full_sale = false', current_user.member.id)
    respond_to do |format|
      # format.html { redirect_to carts_url, notice: 'Cart was successfully removed.' }
      format.js { render "carts/form_resume_cart" }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def set_unique_workplace(cart)

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.require(:cart).permit(:member_id, :script_id, :price_id, :full_sale, workplace_attributes: [:member_id, :organization_name, :system_id, :system_number])
  end

end
