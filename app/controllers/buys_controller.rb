class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]

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
    @price = Price.find_by_script_id(@script.id)
    gon.script_id = @script.id
    gon.price_id = @price.id
    gon.member_id =  current_user.member_id
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

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_buy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def buy_params
  end
end