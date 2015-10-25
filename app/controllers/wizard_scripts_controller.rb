class WizardScriptsController < ApplicationController
  include Wicked::Wizard
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

  def classification
    p 'auiiiiii'
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

end
