class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    if params[:query].present?
      @scripts = Script.search params[:query], page: params[:page], per_page: 10
    else
      @scripts = Script.search '*', page: params[:page], per_page: 10
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
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
