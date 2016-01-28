class ViewPublicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_view_publication, only: [:show, :edit, :update, :destroy]
  before_action :user_active, if: :signed_in?

  # GET /view_publications
  # GET /view_publications.json
  def index
    @view_publications = ViewPublication.all
  end

  # GET /view_publications/1
  # GET /view_publications/1.json
  def show
  end

  # GET /view_publications/new
  def new
    @view_publication = ViewPublication.new
  end

  # GET /view_publications/1/edit
  def edit
  end

  # POST /view_publications
  # POST /view_publications.json
  def create
    @view_publication = ViewPublication.new(view_publication_params)

    respond_to do |format|
      if @view_publication.save
        format.html { redirect_to @view_publication, notice: 'View publication was successfully created.' }
        format.json { render :show, status: :created, location: @view_publication }
      else
        format.html { render :new }
        format.json { render json: @view_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /view_publications/1
  # PATCH/PUT /view_publications/1.json
  def update
    respond_to do |format|
      if @view_publication.update(view_publication_params)
        format.html { redirect_to @view_publication, notice: 'View publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @view_publication }
      else
        format.html { render :edit }
        format.json { render json: @view_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /view_publications/1
  # DELETE /view_publications/1.json
  def destroy
    @view_publication.destroy
    respond_to do |format|
      format.html { redirect_to view_publications_url, notice: 'View publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_view_publication
      @view_publication = ViewPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def view_publication_params
      params.require(:view_publication).permit(:publication_id, :visited, :user_id)
    end
end
