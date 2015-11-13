class WizardScriptsController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  steps :additional_data, :value_chain, :final
  #before_action :set_script, only: [:show, :edit, :update, :destroy]

  def show
    set_tracker_step(step)
    p step
    case step
      when :additional_data then
        set_script
      when :value_chain then
        set_script
        @value_chain = ValueChain.new
        @process_modules = ProcessModule.where('referrer_process_module_id is null')
      when :final then
        set_script
    end
    render_wizard
  end

  def edit
    set_script
  end

  def update
    @script.update_attributes(script_params)
    render_wizard @script
  end

  def create_requeriement
    @requirement = Requirement.new(requirement_params)
    params[:script_id] = @requirement.script_id
    set_script
    respond_to do |format|
      if @requirement.save
        # app_custom_routes format, request.referrer, @requirement
        format.js { render "requeriement_list" }
        format.html {}
      else
        # TODO: adicionar pagina de erro genérica
        # app_custom_routes_errors format, request.referrer, @requirement
      end
    end
  end

  def create_related
    @related_script = RelatedScript.new(related_script_params)
    params[:script_id] = @related_script.script_id
    set_script
    respond_to do |format|
      if @related_script.save
        # app_custom_routes format, request.referrer, @requirement
        format.js { render "related_list" }
        format.html {}
      else
        # TODO: adicionar pagina de erro genérica
        # app_custom_routes_errors format, request.referrer, @requirement
      end
    end
  end

  def destroy_requeriement
    set_script
    @requirement = Requirement.where(id: params[:requirement_id]).first
    @requirement.destroy
    respond_to do |format|
      format.js { render "requeriement_list" }
      format.html {}
    end
  end

  def destroy_related
    set_script
    @related_script = RelatedScript.where(id: params[:related_script_id]).first
    @related_script.destroy
    respond_to do |format|
      format.js { render "related_list" }
      format.html {}
    end
  end


  def classification
    @process_module = ProcessModule.find(params[:process_id])
    @script_id = params[:script_id]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_script
    @script = Script.find(params[:script_id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def script_params
    params.require(:script).permit(:id, :name, :description, :definition, :long_text, :platform, :industry, :solution_type_id, :script_file, :pdf_file, :complexity, :status_id, requirements_attributes: [:id, :script_id, :requirement])
  end

  def requirement_params
    params.require(:requirement).permit(:id, :script_id, :requirement, :script_id_requirement)
  end

  def related_script_params
    params.require(:related_script).permit(:id, :script_id, :related_script_id)
  end
end
