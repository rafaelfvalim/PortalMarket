class LandingPageImagesController < ApplicationController
  before_action :set_landing_page_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?

  # GET /landing_page_images
  # GET /landing_page_images.json
  def index
    @landing_page_images = LandingPageImage.all
  end

  # GET /landing_page_images/1
  # GET /landing_page_images/1.json
  def show
  end

  # GET /landing_page_images/new
  def new
    @landing_page_image = LandingPageImage.new
  end

  # GET /landing_page_images/1/edit
  def edit
  end

  # POST /landing_page_images
  # POST /landing_page_images.json
  def create
    @landing_page_image = LandingPageImage.new(landing_page_image_params)

    respond_to do |format|
      if @landing_page_image.save
        format.html { redirect_to landing_page_images_path }
        format.json { render :show, status: :created, location: @landing_page_image }
      else
        format.html { render :new }
        format.json { render json: @landing_page_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landing_page_images/1
  # PATCH/PUT /landing_page_images/1.json
  def update
    respond_to do |format|
      if @landing_page_image.update(landing_page_image_params)
        format.html { redirect_to landing_page_images_path }
        format.json { render :show, status: :ok, location: @landing_page_image }
      else
        format.html { render :edit }
        format.json { render json: @landing_page_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_page_images/1
  # DELETE /landing_page_images/1.json
  def destroy
    @landing_page_image.destroy
    respond_to do |format|
      format.html { redirect_to landing_page_images_path}
      format.json { head :no_content }
    end
  end

  def ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: LandingPageImagesDatatable.new(view_context) }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing_page_image
      @landing_page_image = LandingPageImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landing_page_image_params
      params.require(:landing_page_image).permit(:name, :image)
    end
end
