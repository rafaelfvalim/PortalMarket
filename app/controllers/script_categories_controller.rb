class ScriptCategoriesController < ApplicationController
  before_action :set_script_category, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /script_categories
  # GET /script_categories.json
  def index
    per_page = 6
    query = params[:query].present? ? params[:query] : "*"
    if params[:status_id].present?
      @scripts = Script.search query, where: {status_id: params[:status_id]}, page: params[:page], per_page: 2
    else
      @scripts = Script.search query, page: params[:page], per_page: 2
    end
    @script_categories = ScriptCategory.all
  end

  # GET /script_categories/1
  # GET /script_categories/1.json
  def show
  end

  # GET /script_categories/new
  def new
    @script_category = ScriptCategory.new
  end

  # GET /script_categories/1/edit
  def edit
  end

  def get_data_ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: ScriptCategoryDatatable.new(view_context) }
    end
  end

  # POST /script_categories
  # POST /script_categories.json
  def create
    @script_category = ScriptCategory.new(script_category_params)
    p @script_category
    @script_category.image_category = @script_category.category.image_dummy
    respond_to do |format|
      if @script_category.save
        format.html { redirect_to action: :index }
        format.json { render :index, status: :created, location: @script_category }
      else
        format.html { render :new }
        format.json { render json: @script_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /script_categories/1
  # PATCH/PUT /script_categories/1.json
  def update
    respond_to do |format|
      if @script_category.update(script_category_params)
        format.html { redirect_to action: :index }
        format.json { render :show, status: :ok, location: @script_category }
      else
        format.html { render :edit }
        format.json { render json: @script_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /script_categories/1
  # DELETE /script_categories/1.json
  def destroy
    @script_category.destroy
    respond_to do |format|
      format.html { redirect_to script_categories_url, notice: 'Script category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_script_category
    @script_category = ScriptCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def script_category_params
    params.require(:script_category).permit(:category_id, :script_id, :image_category)
  end

  def sort_column
    Script.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
