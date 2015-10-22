class WizardScriptsController < ApplicationController
  include Wicked::Wizard
  steps :step1, :step2, :step3, :final, :edit
  #before_action :set_script, only: [:show, :edit, :update, :destroy]


  def show
    set_tracker_step(step)
    case step
      when :step1 then
        @script = Script.new
      when :step2 then
        set_script
      when :step3 then
        set_script
        @value_chain = ValueChain.new
        @process_modules = ProcessModule.where('referrer_process_module_id is null')
      when :final then
        set_script
      when :edit then
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
    @process_module = ProcessModule.find(params[:process_id])
    @script_id = params[:script_id]
  end

  private

  def set_tracker_step(action)
    case action
      when :step1 then
        @step1 = 'active'
      when :edit then
        @step1 = 'active'
      when :step2 then
        @step1 = 'complete'
        @step2 = 'active'
      when :step3 then
        @step1 = 'complete'
        @step2 = 'complete'
        @step3 = 'active'
      when :final then
        @step1 = 'complete'
        @step2 = 'complete'
        @step3 = 'complete'
        @final = 'active'
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

end
