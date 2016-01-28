class FileTagsController < ApplicationController
  before_action :set_file_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?
  before_action :acess_control

  # GET /file_tags
  # GET /file_tags.json
  def index
    @file_tags = FileTag.all
  end

  # GET /file_tags/1
  # GET /file_tags/1.json
  def show
  end

  # GET /file_tags/new
  def new
    @file_tag = FileTag.new
  end

  # GET /file_tags/1/edit
  def edit
  end

  # POST /file_tags
  # POST /file_tags.json
  def create
    @file_tag = FileTag.new(file_tag_params)

    respond_to do |format|
      if @file_tag.save
        format.html { redirect_to @file_tag, notice: 'File tag was successfully created.' }
        format.json { render :show, status: :created, location: @file_tag }
      else
        format.html { render :new }
        format.json { render json: @file_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_tags/1
  # PATCH/PUT /file_tags/1.json
  def update
    respond_to do |format|
      if @file_tag.update(file_tag_params)
        format.html { redirect_to @file_tag, notice: 'File tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_tag }
      else
        format.html { render :edit }
        format.json { render json: @file_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_tags/1
  # DELETE /file_tags/1.json
  def destroy
    @file_tag.destroy
    respond_to do |format|
      format.html { redirect_to file_tags_url, notice: 'File tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_tag
      @file_tag = FileTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_tag_params
      params.require(:file_tag).permit(:name)
    end
end
