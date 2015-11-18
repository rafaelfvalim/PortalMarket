class ScriptsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_script, only: [:show, :edit, :update, :destroy, :remove_file_script, :remove_file_pdf, :admin_update]

  # GET /scripts
  # GET /scripts.json
  def index
    @scripts = Script.all
  end

  # GET /scripts/1
  # GET /scripts/1.json
  def show
    respond_to do |format|
      case
        when request.referrer.include?('edit')
          format.html { redirect_to :back }
        else
          format.html
      end
    end
  end

  def check_complexity
    @script = Script.find(params[:script_id])
  end

  def autocomplete
    render json: Script.search(params[:query], autocomplete: true, limit: 10).map(&:description)
  end

  def edit_additional_information
    @script = Script.find_by id: params[:id]
  end

  # GET /scripts/new
  def new
    @script = Script.new
    @script.member_scripts.build
    set_tracker_step(:create)
  end

  # GET /scripts/1/edit
  def edit
    set_tracker_step(:create)
  end

  # POST /scripts
  # POST /scripts.json
  def create
    @script = Script.new(script_params)
    @user = current_user
    respond_to do |format|
      if @script.save
        @member_script = MemberScript.new(script_id: @script.id, member_id: @user.member.id, percentual: 0, participation: 0, status_id: 6)
        @member_script.save
        format.html { redirect_to wizard_scripts_path(id: 'additional_data', script_id: @script.id) }
      else
        flash.now[:danger] = "Script can not be saved, check the fields!"
        set_tracker_step(:create)
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_file_script
    @script.remove_script_file!
    respond_to do |format|
      if @script.reload
        format.js { render "upload_scrip" }
        format.html {}
      end
    end
  end

  def remove_file_pdf
    @script.remove_pdf_file!
    respond_to do |format|
      if @script.reload
        format.js { render "upload_pdf" }
        format.html {}
      end
    end
  end

  def additional_information
    @sub_action = 'create'
    @script = Script.find_by id: params[:id]
    @script.requirements.build
    @script.related_scripts.build
    @scripts = Script.includes(:requirements, :related_scripts).where('id =?', params[:script_id])
    @create_script_tracker = 'complete'
    @additional_information = 'active'
  end

  def script_orchestration
    @scripts = Script.where(:status_id => params[:status_id]).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
    @status = Status.find(params[:status_id])
    @statuses = Status.where('id != ?', params[:status_id])
  end

  def process_orchestration
    @status_id = params[:status][:id]
    current_status = params[:current_status]
    scripts = Script.where(id: params[:script_ids])

    respond_to do |format|
      if @status_id.nil?
        format.js { render "form_script_orchestration" }
      elsif scripts.map { |s| s.update_attribute(:status_id, @status_id) }
        @scripts = Script.where(:status_id => current_status).paginate(:page => params[:page], :per_page => 30).order('updated_at ASC')
        format.js { render "form_script_orchestration" }
        format.html {}
      end

    end
  end

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    respond_to do |format|
      if @script.update(script_params)
        set_tracker_step(:create)
        format.html { redirect_to wizard_script_path(id: :additional_data, script_id: @script.id) }
      else
        set_tracker_step(:create)
        format.html { render :edit }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_update
    respond_to do |format|

      if @script.update(script_params)
        if params[:status_id].nil?
          format.html { redirect_to admin_update_scripts_path }
        else
          format.html { redirect_to script_orchestration_scripts_path(status_id: params[:status_id]) }
        end
      else
        format.html { render :edit }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.json
  def destroy
    @script.destroy
    respond_to do |format|
      format.html { redirect_to scripts_url, notice: 'Script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def roll_back_script
    @script = Script.find_by id: params[:id]
    if !@script.blank?
      @member_script = MemberScript.find_by_script_id(@script.id)

      if @member_script.blank?
        @member_script.destroy
      end
      @related_scripts = RelatedScript.where(script_id: @script.id)

      if !@related_scripts.blank?
        @related_scripts.destroy_all
      end
      @requirements = Requirement.where(script_id: @script.id)
      if !@requirements.blank?
        @requirements.destroy_all
      end
      @value_chains = ValueChain.where(script_id: @script.id)
      if !@value_chains.blank?
        @value_chains.destroy_all
      end
      @script.destroy
    end
    respond_to do |format|
      format.html { redirect_to contributor_members_path }
    end
  end

  def update_status
    respond_to do |format|
      @script = Script.find_by id: params[:id]
      if @script.update_attribute(:status_id, 1)
        format.html { redirect_to contributor_members_path }
      end
    end
  end

  def autocomplete_requeriment
    @scripts = Script.where('description LIKE ?', "%#{params[:term]}%")
    respond_to do |format|
      format.html
      #format.json { render json: @requirements.map(&:requirement) }
      format.json { render json: @scripts.to_json }
    end
  end

  def autocomplete_related_script
    @scripts = Script.where('description LIKE ?', "%#{params[:term]}%")
    respond_to do |format|
      format.html
      #format.json { render json: @scripts.map{|c| {:description => c.description, :id => c.id } }}
      format.json { render json: @scripts.to_json }
    end
  end

  def final_details
    @script = Script.find_by id: params[:id]
    @value_chains = ValueChain.where('script_id = ?', @script.id)
    @process_modules = ProcessModule.where('script_id = ?', @script.id)
    # TODO localização provisória do reindex
    # TODO Tornar isso um JOB
    Script.reindex
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_script
    @script = Script.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def script_params
    params.require(:script).permit(:id, :name, :description, :definition, :long_text, :platform, :industry, :solution_type_id, :script_file, :pdf_file, :complexity, :status_id, :script_file_cache, :pdf_file_cache, requirements_attributes: [:id, :script_id, :requirement])
  end

  def download
    path = "/#{script.script}"
    send_file path, :x_sendfile => true
  end


end
