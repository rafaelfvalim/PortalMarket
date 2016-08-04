class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  before_action :user_active, if: :signed_in?

  # GET /searches
  # GET /searches.json
  def index
    Script.reindex
    per_page = 12
    @process_modules = ProcessModule.where('referrer_process_module_id is null')
    @scripts = SearchesService.new.engine(params, per_page, current_user)
    respond_to do |format|
      format.js { render "results" }
      format.html {}
    end

  end

  def like
    @script = Script.find(params[:script_id])
    if params[:script_like_id].present?
      ScriptLike.destroy params[:script_like_id]
    else
      location = GeolocationService.new.get_by_ip(current_user.current_sign_in_ip)
      like = ScriptLike.new script_id: params[:script_id], user_id: current_user.id, country: location.country, city: location.city, countryCode: location.countryCode, regionName: location.regionName, region: location.region
      like.save
    end

    respond_to do |format|
      format.js { render "searches/likes" }
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
