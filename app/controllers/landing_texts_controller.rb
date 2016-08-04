class LandingTextsController < ApplicationController
  before_action :set_landing_text, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?

  # GET /landing_texts
  # GET /landing_texts.json
  def index
    @landing_texts = LandingText.all
  end

  # GET /landing_texts/1
  # GET /landing_texts/1.json
  def show
  end

  # GET /landing_texts/new
  def new
    @landing_text = LandingText.new
  end

  # GET /landing_texts/1/edit
  def edit
  end

  # POST /landing_texts
  # POST /landing_texts.json
  def create
    @landing_text = LandingText.new(landing_text_params)

    respond_to do |format|
      if @landing_text.save
        format.html { redirect_to landing_texts_path }
        format.json { render :show, status: :created, location: @landing_text }
      else
        format.html { render :new }
        format.json { render json: @landing_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landing_texts/1
  # PATCH/PUT /landing_texts/1.json
  def update
    respond_to do |format|
      if @landing_text.update(landing_text_params)
        format.html { redirect_to landing_texts_path }
        format.json { render :show, status: :ok, location: @landing_text }
      else
        format.html { render :edit }
        format.json { render json: @landing_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_texts/1
  # DELETE /landing_texts/1.json
  def destroy
    @landing_text.destroy
    respond_to do |format|
      format.html { redirect_to landing_texts_url, notice: 'Landing text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def texts_ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: LandingPageTextsDatatable.new(view_context) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_landing_text
    @landing_text = LandingText.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def landing_text_params
    params.require(:landing_text).permit(:title, :subtitle, :content, :location_name)
  end
end
