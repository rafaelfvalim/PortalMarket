class WizardScriptsController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?
  #before_action :set_script, only: [:show, :edit, :update, :destroy]
  before_action :set_script, only: [:show]

  steps :add_docs, :additional_data, :value_chain, :final

  def show
    set_tracker_step(step)
    case step
      when :add_docs then
        @attachment_docs = AttachmentDoc.where(script_id:@script.id)
      when :additional_data then
        search_script(params[:search], params[:page])
      when :value_chain then
        @value_chain = ValueChain.new
        @process_modules = ProcessModule.where('referrer_process_module_id is null')
      when :final then
        search_company_controller(params[:search], params[:select_field])
        @attachment_docs = AttachmentDoc.where(script_id:@script.id)
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
      search_script(params[:search], params[:page])

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

  def add_participation_member
    set_script
    MemberScript.create(member_id: params[:member_id], script_id: params[:script_id], percentual: 0, participation: 0, partner: true)
    search_company_controller(" ", " ")
    respond_to do |format|
      format.js { render "final" }
      format.html {}
    end
  end

  def add_percentual_participation
    set_script
    member_script = MemberScript.find(params[:member_script_id])
    member_script.update_attribute(:percentual, params[:percentual])
    @total_percent = MemberScript.where(script_id: @script.id).sum(:percentual)

    if @total_percent > 100.0
      member_script.update_attribute(:percentual, 0.0)
    end
    search_company_controller(" ", " ")
    respond_to do |format|
      format.js { render "final" }
      format.html {}
    end
  end

  def remove_participation_member
    set_script
    search_company_controller(" ", " ")
    if MemberScript.destroy(params[:member_script_id])
      respond_to do |format|
        format.js { render "final" }
        format.html {}
      end
    end
  end

  def search_company_controller(search, field = 'company_name')
    if search.present?
      @members_participation = Member.includes(:user).paginate(:page => params[:page], :per_page => 10).search_company(search, field)
    else
      @members_participation = Member.where.not(cnpj: '').paginate(:page => params[:page], :per_page => 10).order('updated_at ASC')
    end
  end

  def search_script(query_search, page)
    Script.reindex
    if query_search.present?
      @found_scripts = Script.search query_search, where: {has_price: present?, status_id: Status::APROVADO}, page: page, per_page: 12
    else
      @found_scripts = Script.search '*', where: {has_price: present?, status_id: Status::APROVADO}, page: page, per_page: 12
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
