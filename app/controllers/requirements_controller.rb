class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /
  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(requirement_params)
    p 'debug:: create requeriement'
    respond_to do |format|
      if @requirement.save
        # app_custom_routes format, request.referrer, @requirement
        format.js { render "wizard_scripts/form_additional_information" }
        format.html {}
      else
        # app_custom_routes_errors format, request.referrer, @requirement
      end
    end
  end


  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_ajax
    @requirement = Requirement.new(requirement_params)
    respond_to do |format|
      if @requirement.save
        app_custom_routes format, request.referrer, @requirement.script
      else
        app_custom_routes format, request.referrer, @requirement
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def requirement_params
    params.require(:requirement).permit(:id, :script_id, :requirement, :script_id_requirement)
  end
end
