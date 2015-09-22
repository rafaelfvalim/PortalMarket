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
  end

  # GET /scripts/new
  def new
    @script = Script.new
    @script.member_scripts.build
  end

  # GET /scripts/1/edit
  def edit
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
        format.html { redirect_to script_classification_path(@script) }
        format.json { render :show, status: :created, location: @script }
      else
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def classification
    @script = Script.find_by id: params[:script_id]
    @script.requirements.build
    @script.related_scripts.build
    @scripts = Script.includes(:requirements, :related_scripts).where('id =?', params[:script_id])
  end

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    respond_to do |format|
      if @script.update(script_params)
        format.html { redirect_to @script, notice: 'Script was successfully updated.' }
        format.json { render :show, status: :ok, location: @script }
      else
        if request.referrer.includes?('classification')

        else
          format.html { render :edit }
          format.json { render json: @script.errors, status: :unprocessable_entity }
        end
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

  def autocomplete_requeriment
    @requirements = Requirement.where('requirement LIKE ?', "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { render json: @requirements.map(&:requirement) }
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_script
    @script = Script.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def script_params
    params.require(:script).permit(:id, :description, :definition, :long_text, :platform, :industry, :solution_type_id, :script_file, :pdf_file, :complexity, requirements_attributes: [:id, :script_id, :requirement])
  end

end
