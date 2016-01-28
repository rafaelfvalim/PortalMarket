class PaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pay, only: [:show, :edit, :update, :destroy]
  before_action :user_active, if: :signed_in?
  before_action :acess_control
  # GET /pays
  # GET /pays.json
  def index
  end

  # GET /pays/1
  # GET /pays/1.json
  def show
  end

  # GET /pays/new
  def new
  end

  # GET /pays/1/edit
  def edit
  end

  # POST /pays
  # POST /pays.json
  def create
  end

  # PATCH/PUT /pays/1
  # PATCH/PUT /pays/1.json
  def update
  end

  # DELETE /pays/1
  # DELETE /pays/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_params
    end
end
