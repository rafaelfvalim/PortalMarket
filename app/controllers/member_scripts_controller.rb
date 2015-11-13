class MemberScriptsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member_script, only: [:show, :edit, :update, :destroy]

  # GET /member_scripts
  # GET /member_scripts.json
  def index
   # @member_scripts = MemberScript.all
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: MemberScriptDatatable.new(view_context)}
    end
  end

  # GET /member_scripts/1
  # GET /member_scripts/1.json
  def show
  end

  # GET /member_scripts/new
  def new
    @member_script = MemberScript.new
  end

  # GET /member_scripts/1/edit
  def edit
  end

  # POST /member_scripts
  # POST /member_scripts.json
  def create
    @member_script = MemberScript.new(member_script_params)

    respond_to do |format|
      if @member_script.save
        format.html { redirect_to @member_script, notice: 'Member script was successfully created.' }
        format.json { render :show, status: :created, location: @member_script }
      else
        format.html { render :new }
        format.json { render json: @member_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_scripts/1
  # PATCH/PUT /member_scripts/1.json
  def update
    respond_to do |format|
      if @member_script.update(member_script_params)
        format.html { redirect_to @member_script, notice: 'Member script was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_script }
      else
        format.html { render :edit }
        format.json { render json: @member_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_scripts/1
  # DELETE /member_scripts/1.json
  def destroy
    @member_script.destroy
    respond_to do |format|
      format.html { redirect_to member_scripts_url, notice: 'Member script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_member_script
    @member_script = MemberScript.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_script_params
    params.require(:member_script).permit(:id, :member_id, :script_id, :participation, :percentual)
  end
end
