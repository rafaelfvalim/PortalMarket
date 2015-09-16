class ProcessModulesController < ApplicationController
  before_action :set_process_module, only: [:show, :edit, :update, :destroy]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_module
      @process_module = ProcessModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def process_module_params
      params.require(:process_module).permit(:description, :self_process_module_id)
    end
end
