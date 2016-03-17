class PublicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publication, only: [:show, :edit, :update, :destroy, :download, :get_news_count]
  before_action :user_active, if: :signed_in?

  # GET /publications
  # GET /publications.json
  def index
    if params[:query].present? && params[:query] != 'All'
      @publications = Publication.search(params[:query], current_user.publication_group)
    else
      @publications = Publication.where('view_group = ? or view_group = ?', current_user.publication_group, 'Todos')
    end
    if current_user.is_god?
      redirect_to admin_publications_path
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  def admin
    unless current_user.is_god?
      redirect_to publications_path
    end
    if params[:query].present? && params[:query] != 'Todos'
      @publications = Publication.search(params[:query], params[:view_group])
    else
      if params[:view_group].present?
        @publications = Publication.joins(:folder).where(:view_group => params[:view_group])
      else
        @publications = Publication.joins(:folder).all
      end
    end
    @publication = Publication.new
    @folder = Folder.new
  end

  def download
    @file_name = "#{Rails.root}/public#{@publication.file_name.url}"
    send_file(@file_name)
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  def get_news_count
    ViewPublication.where(publication_id: @publication.id, visited: true, user_id: current_user.id).first_or_create
    count = Publication.all.count - ViewPublication.where(user_id: current_user.id).count
    respond_to do |format|
      format.html
      format.json { render json: count }
    end
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user
    respond_to do |format|
      if @publication.save
        format.html { redirect_to publications_path, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publications_path, notice: 'Publication was successfully updated.' }
        format.json { render :index, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_params
    params.require(:publication).permit(:file_name, :file_type, :user_id, :folder_id, :tag_id, :view_group)
  end
end
