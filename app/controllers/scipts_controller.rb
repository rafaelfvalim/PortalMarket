class SciptsController < ApplicationController
  before_action :set_scipt, only: [:show, :edit, :update, :destroy]

  # GET /scipts
  # GET /scipts.json
  def index
    @scipts = Scipt.all
  end

  # GET /scipts/1
  # GET /scipts/1.json
  def show
  end

  # GET /scipts/new
  def new
    @scipt = Scipt.new
  end

  # GET /scipts/1/edit
  def edit
  end

  # POST /scipts
  # POST /scipts.json
  def create
    @scipt = Scipt.new(scipt_params)

    respond_to do |format|
      if @scipt.save
        format.html { redirect_to @scipt, notice: 'Scipt was successfully created.' }
        format.json { render :show, status: :created, location: @scipt }
      else
        format.html { render :new }
        format.json { render json: @scipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scipts/1
  # PATCH/PUT /scipts/1.json
  def update
    respond_to do |format|
      if @scipt.update(scipt_params)
        format.html { redirect_to @scipt, notice: 'Scipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @scipt }
      else
        format.html { render :edit }
        format.json { render json: @scipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scipts/1
  # DELETE /scipts/1.json
  def destroy
    @scipt.destroy
    respond_to do |format|
      format.html { redirect_to scipts_url, notice: 'Scipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scipt
      @scipt = Scipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scipt_params
      params.require(:scipt).permit(:description, :definition, :plataform, :industry, :solution_id, :script_file, :pdf_file, :complexity)
    end
end
