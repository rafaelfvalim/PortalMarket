class ProcessModulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_process_module, only: [:show, :edit, :update, :destroy, :remove_image]
  before_action :acess_control

  # GET /process_modules
  # GET /process_modules.json
  def index
    @process_modules = ProcessModule.all
  end

  # GET /process_modules/1
  # GET /process_modules/1.json
  def show
  end

  # GET /process_modules/new
  def new
    @process_module = ProcessModule.new
  end

  # GET /process_modules/1/edit
  def edit
  end

  # POST /process_modules
  # POST /process_modules.json
  def create
    @process_module = ProcessModule.new(process_module_params)

    respond_to do |format|
      if @process_module.save
        format.html { redirect_to @process_module, notice: 'Process module was successfully created.' }
        format.json { render :show, status: :created, location: @process_module }
      else
        format.html { render :new }
        format.json { render json: @process_module.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_list_ajax
    respond_to do |format|
      format.html
      format.json { render json: ProcessModule.where('referrer_process_module_id = ?', params[:id]) }
    end
  end


  # PATCH/PUT /process_modules/1
  # PATCH/PUT /process_modules/1.json
  def update
    respond_to do |format|
      if @process_module.update(process_module_params)
        format.html { redirect_to @process_module, notice: 'Process module was successfully updated.' }
        format.json { render :show, status: :ok, location: @process_module }
      else
        format.html { render :edit }
        format.json { render json: @process_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_modules/1
  # DELETE /process_modules/1.json
  def destroy
    @process_module.destroy
    respond_to do |format|
      format.html { redirect_to process_modules_url, notice: 'Process module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_image
    @process_module.remove_image!
    respond_to do |format|
      if @process_module.save
        format.html { redirect_to process_modules_url, notice: 'Image was successfully removed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_process_module
    @process_module = ProcessModule.find(params[:id])
  end

  def acess_control
    unless current_user.is_god?
      redirect_to members_path , :alert => "Restricted access! "
    end
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def process_module_params
    params.require(:process_module).permit(:description,:referrer_process_module_id,:image ,:image_cache)
  end
end
