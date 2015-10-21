class ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :edit, :update, :destroy]


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
    @create_script_tracker = 'active'
    @sub_action = 'create'
  end

  # GET /scripts/1/edit
  def edit
    @referer = URI(request.referer).path
    if @referer.include?('/additional_information')
      @sub_action = 'create'
      @create_script_tracker = 'active'
    else
      @sub_action = 'edit'
    end
  end

  # POST /scripts
  # POST /scripts.json
  def create
    @script = Script.new(script_params)
    @user = current_user
    respond_to do |format|
      if @script.save
        @member_script = MemberScript.new(script_id: @script.id, member_id: @user.member_id, percentual: 0, participation: 0)
        @member_script.save
        # format.html { redirect_to @script, notice: 'Script was successfully created.' }
        format.html { redirect_to additional_information_scripts_path(:id => @script.id) }
        format.json { render :show, status: :created, location: @script }
      else
        @create_script_tracker = 'active'
        @sub_action = 'create'
        flash.now[:danger] = "Script can not be saved, check the fields!"
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
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

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    @referer = URI(request.referer).path
    respond_to do |format|
      if @script.update(script_params)
        if params[:sub_action] == 'back'
          format.html { redirect_to edit_script_path(@script.id) }
        end
        if params[:sub_action] == 'additional_information'
          format.html { redirect_to build_value_chain_path(@script.id) }
        end
        if params[:sub_action] == 'create'
          @sub_action = params[:sub_action]
          format.html { redirect_to additional_information_scripts_path(:id => @script.id) }
        end
        if params[:sub_action] == 'edit'
          @sub_action = params[:sub_action]
          format.html {  }
        end
        format.html { redirect_to @script, notice: 'Script was successfully updated.' }
        format.json { render :show, status: :ok, location: @script }
      else
        @sub_action = 'create'
        @create_script_tracker = 'complete'
        @additional_information = 'active'
        flash.now[:danger] = "Script can not be saved, check the fields!"
        format.html { render :additional_information }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
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
    @create_script_tracker = 'complete'
    @additional_information = 'complete'
    @value_chain_tracker = 'complete'
    @finish_script_tracker = 'active'
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
    params.require(:script).permit(:id, :name, :description, :definition, :long_text, :platform, :industry, :solution_type_id, :script_file, :pdf_file, :complexity, :status_id, requirements_attributes: [:id, :script_id, :requirement])
  end

end
