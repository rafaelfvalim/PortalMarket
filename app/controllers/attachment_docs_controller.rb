class AttachmentDocsController < ApplicationController
  before_action :set_attachment_doc, only: [:show, :edit, :update]
  # GET /attachment_docs
  # GET /attachment_docs.json
  def index
    @attachment_docs = AttachmentDoc.all
  end

  # GET /attachment_docs/1
  # GET /attachment_docs/1.json
  def show
  end

  # GET /attachment_docs/new
  def new
    @attachment_doc = AttachmentDoc.new
  end

  # GET /attachment_docs/1/edit
  def edit
  end

  # POST /attachment_docs
  # POST /attachment_docs.json
  def create
    @attachment_doc = AttachmentDoc.new(file_name: params[:file], script_id: params[:script_id])
    if @attachment_doc.save
      render json: @attachment_doc
    else
      render json: {error: 'Falha no processo de carregamento'}, status: 422
    end
  end

  def delete_attachments
    AttachmentDoc.where(id: params[:attachment_docs]).destroy_all

    respond_to do |format|
      format.html { redirect_to wizard_script_path(id: :add_docs, script_id: params[:script_id]) }
    end
  end

  def delete_all
    AttachmentDoc.delete_all(script_id: params[:script_id])
    respond_to do |format|
      format.html { redirect_to wizard_script_path(id: :add_docs, script_id: params[:script_id]) }
    end
  end

  # PATCH/PUT /attachment_docs/1
  # PATCH/PUT /attachment_docs/1.json
  def update
    respond_to do |format|
      if @attachment_doc.update(attachment_doc_params)
        format.html { redirect_to @attachment_doc, notice: 'Attachment doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment_doc }
      else
        format.html { render :edit }
        format.json { render json: @attachment_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachment_docs/1
  # DELETE /attachment_docs/1.json
  def destroy
    AttachmentDoc.where(id: params[:attachment_docs]).destroy_all
    respond_to do |format|
      format.html { redirect_to wizard_script_path(id: get_path(params[:path]), script_id: params[:script_id]) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attachment_doc
    @attachment_doc = AttachmentDoc.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attachment_doc_params
    params.require(:attachment_doc).permit(:script_id, :file_name)
  end

  def get_path(path = 'add_docs')
    return path
  end
end
