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
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      query = params[:query].present? ? params[:query] : "*"

      case @category.search_param
        when 'prelancamento' then
          if params[:process_description_selected].present?
            @scripts = Script.search query, where: {
                has_price: present?,
                status_id: [Status::PRE_LANCAMENTO_APROVADO],
                process_module_description: params[:process_description_selected].to_s,
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          else
            @scripts = Script.search query, where: {
                has_price: present?,
                status_id: [Status::PRE_LANCAMENTO_APROVADO]
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          end
        else
          if params[:process_description_selected].present?
            clausula_where = @category << query
            @scripts = Script.search clausula_where, where: {
                has_price: present?,
                status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO],
                process_module_description: params[:process_description_selected].to_s,
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          else
            clausula_where = @category << query
            @scripts = Script.search clausula_where, where: {
                has_price: present?,
                status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
            }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
          end

      end

    else

      if params[:query].present?
        if params[:process_description_selected].present?
          @scripts = Script.search params[:query], where: {
              has_price: present?,
              status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO],
              process_module_description: params[:process_description_selected].to_s,
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
        else
          @scripts = Script.search params[:query], where: {
              has_price: present?,
              status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page

        end

      end
      unless params[:query].present?
        if params[:process_description_selected].present?
          @scripts = Script.search '*', where: {has_price: present?,
                                                status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO],
                                                process_module_description: params[:process_description_selected].to_s,
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
        else
          @scripts = Script.search '*', where: {
              has_price: present?,
              status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
          }, track: {user_id: current_user.id}, page: params[:page], per_page: per_page
        end
      end

    end

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
      like = ScriptLike.new script_id: params[:script_id], user_id: current_user.id
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
