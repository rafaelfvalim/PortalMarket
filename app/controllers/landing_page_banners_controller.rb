class LandingPageBannersController < ApplicationController
  before_action :set_landing_page_banner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?
  # GET /landing_page_banners
  # GET /landing_page_banners.json
  def index
    @landing_page_banners = LandingPageBanner.all
  end

  # GET /landing_page_banners/1
  # GET /landing_page_banners/1.json
  def showm
  end

  # GET /landing_page_banners/new
  def new
    @landing_page_banner = LandingPageBanner.new
  end

  def ajax
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: LandingPageBannersDatatable.new(view_context) }
    end
  end

  # GET /landing_page_banners/1/edit
  def edit
  end

  # POST /landing_page_banners
  # POST /landing_page_banners.json
  def create
    @landing_page_banner = LandingPageBanner.new(landing_page_banner_params)

    respond_to do |format|
      if @landing_page_banner.save
        format.html { redirect_to landing_page_banners_path, notice: 'Landing page banner was successfully created.' }
        format.json { render :show, status: :created, location: @landing_page_banner }
      else
        format.html { render :new }
        format.json { render json: @landing_page_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landing_page_banners/1
  # PATCH/PUT /landing_page_banners/1.json
  def update
    respond_to do |format|
      if @landing_page_banner.update(landing_page_banner_params)
        format.html { redirect_to landing_page_banners_path, notice: 'Landing page banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @landing_page_banner }
      else
        format.html { render :edit }
        format.json { render json: @landing_page_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_page_banners/1
  # DELETE /landing_page_banners/1.json
  def destroy
    @landing_page_banner.destroy
    respond_to do |format|
      format.html { redirect_to landing_page_banners_path, notice: 'Landing page banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing_page_banner
      @landing_page_banner = LandingPageBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landing_page_banner_params
      params.require(:landing_page_banner).permit(:landing_text_id, :landing_page_image_id, :background_image, :name, :position, :item_list)
    end
end
