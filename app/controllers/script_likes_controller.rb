class ScriptLikesController < ApplicationController
  before_action :set_script_like, only: [:show, :edit, :update, :destroy]

  # GET /script_likes
  # GET /script_likes.json
  def index
    @script_likes = ScriptLike.all
  end

  # GET /script_likes/1
  # GET /script_likes/1.json
  def show
  end

  # GET /script_likes/new
  def new
    @script_like = ScriptLike.new
  end

  # GET /script_likes/1/edit
  def edit
  end

  # POST /script_likes
  # POST /script_likes.json
  def create
    location = GeolocationService.new.get_by_ip(current_user.current_sign_in_ip)
    @script_like = ScriptLike.new(script_like_params)
    @script_like.country = location.country
    @script_like.city = location.city
    @script_like.countryCode = location.countryCode
    @script_like.regionName = location.regionName
    @script_like.region = location.region
    p location
    respond_to do |format|
      if @script_like.save
        format.html { redirect_to @script_like, notice: 'Script like was successfully created.' }
        format.json { render :show, status: :created, location: @script_like }
      else
        format.html { render :new }
        format.json { render json: @script_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /script_likes/1
  # PATCH/PUT /script_likes/1.json
  def update
    respond_to do |format|
      if @script_like.update(script_like_params)
        format.html { redirect_to @script_like, notice: 'Script like was successfully updated.' }
        format.json { render :show, status: :ok, location: @script_like }
      else
        format.html { render :edit }
        format.json { render json: @script_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /script_likes/1
  # DELETE /script_likes/1.json
  def destroy
    @script_like.destroy
    respond_to do |format|
      format.html { redirect_to script_likes_url, notice: 'Script like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_script_like
    @script_like = ScriptLike.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def script_like_params
    params.require(:script_like).permit(:script_id, :user_id, :city, :country, :countryCode, :regionName, :region)
  end
end
