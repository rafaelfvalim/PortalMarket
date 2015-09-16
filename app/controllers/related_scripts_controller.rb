class RelatedScriptsController < ApplicationController
  before_action :set_related_script, only: [:show, :edit, :update, :destroy]

  # GET /related_scripts
  # GET /related_scripts.json
  def index
    @related_scripts = RelatedScript.all
  end

  # GET /related_scripts/1
  # GET /related_scripts/1.json
  def show
  end

  # GET /related_scripts/new
  def new
    @related_script = RelatedScript.new
  end

  # GET /related_scripts/1/edit
  def edit
  end

  # POST /related_scripts
  # POST /related_scripts.json
  def create
    @related_script = RelatedScript.new(related_script_params)

    respond_to do |format|
      if @related_script.save
        format.html { redirect_to @related_script, notice: 'Related script was successfully created.' }
        format.json { render :show, status: :created, location: @related_script }
      else
        format.html { render :new }
        format.json { render json: @related_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /related_scripts/1
  # PATCH/PUT /related_scripts/1.json
  def update
    respond_to do |format|
      if @related_script.update(related_script_params)
        format.html { redirect_to @related_script, notice: 'Related script was successfully updated.' }
        format.json { render :show, status: :ok, location: @related_script }
      else
        format.html { render :edit }
        format.json { render json: @related_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /related_scripts/1
  # DELETE /related_scripts/1.json
  def destroy
    @related_script.destroy
    respond_to do |format|
      format.html { redirect_to related_scripts_url, notice: 'Related script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related_script
      @related_script = RelatedScript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def related_script_params
      params.require(:related_script).permit(:related_script)
    end
end
