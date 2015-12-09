class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    Script.reindex
    @process_modules = ProcessModule.where('referrer_process_module_id is null')

    if params[:query].present?
      Script.search params[:query], track: true
    end

    if params[:query].present? && params[:process_description_selected].present?
      @scripts = Script.search params[:query], where: {has_price: present?, process_module_description: params[:process_description_selected].to_s}, page: params[:page], per_page: 10
    end

    if !params[:query].present? && params[:process_description_selected].present?
      @scripts = Script.search '*', where: {has_price: present?, process_module_description: params[:process_description_selected].to_s}, page: params[:page], per_page: 10
    end

    if params[:query].present? && !params[:process_description_selected].present?
      @scripts = Script.search params[:query], where: {has_price: present?}, page: params[:page], per_page: 10
    end

    if params[:query].present?
      query = Query.find_or_initialize_by search_term: params[:query]
      query.update_attributes(search_term: params[:query], user_id: current_user.id)
    end

    respond_to do |format|
      format.js { render "results" }
      format.html {}
    end

  end

  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  def find_process

  end

  # GET /searches/new
  def new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_search
    @search = Search.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params[:search]
  end
end
