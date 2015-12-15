class WizardScriptsController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  steps :additional_data, :value_chain, :final
  #before_action :set_script, only: [:show, :edit, :update, :destroy]
  before_action :set_script, only: [:show]

  def show
    set_tracker_step(step)
    case step
      when :additional_data then
        search_script(params[:search], params[:select_field])
      when :value_chain then
        @value_chain = ValueChain.new
        @process_modules = ProcessModule.where('referrer_process_module_id is null')
      when :final then
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
        search_script(params[:search], params[:select_field])
        format.js { render "requirements_list" }
        format.html {}
      else
        # TODO: adicionar pagina de erro genérica
      end
    end
  end

  def create_related
    @related_script = RelatedScript.new(related_script_params)
    respond_to do |format|
      set_script
      search_script(params[:search], params[:select_field])

      if @related_script.save
        format.js { render "related_list" }
        format.html {}
      else
        # TODO: adicionar pagina de erro genérica
      end
    end
  end

  def destroy_requeriement
    set_script
    @requirement = Requirement.where(id: params[:requirement_id]).first
    @requirement.destroy
    respond_to do |format|
      search_script(params[:search], params[:select_field])
      format.js { render "requirements_list" }
      format.html {}
    end
  end

  def destroy_related
    set_script
    @related_script = RelatedScript.where(id: params[:related_script_id]).first
    @related_script.destroy
    search_script(params[:search], params[:select_field])
    respond_to do |format|
      format.js { render "related_list" }
      format.html {}
    end
  end

  def classification
    @process_module = ProcessModule.find(params[:process_id])
    @script_id = params[:script_id]
  end

  def search_script(search, field = 'name')
    if search.present?
      @found_scripts = Script.includes(:related_scripts).paginate(:page => params[:page], :per_page => 30).search_related(search, field)
    else
      @found_scripts = Script.where("has_price = 1 AND status_id != 6").paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
    end
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
