class LandingPageContactsController < ApplicationController
  before_action :set_landing_page_contact, only: [:show, :edit, :update, :destroy]

  # GET /landing_page_contacts
  # GET /landing_page_contacts.json
  def index
    @landing_page_contacts = LandingPageContact.all
  end

  # GET /landing_page_contacts/1
  # GET /landing_page_contacts/1.json
  def show
  end

  # GET /landing_page_contacts/new
  def new
    @landing_page_contact = LandingPageContact.new
  end

  # GET /landing_page_contacts/1/edit
  def edit
  end

  # POST /landing_page_contacts
  # POST /landing_page_contacts.json
  def create
    @landing_page_contact = LandingPageContact.new(landing_page_contact_params)
    respond_to do |format|
      if @landing_page_contact.save
        LandingPageContactMail.landing_page_contact_mail(@landing_page_contact).deliver_now
        format.html { redirect_to visitors_path }
        format.json { render :show, status: :created, location: @landing_page_contact }
      else
        format.html { redirect_to visitors_path }
        format.json { render json: @landing_page_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landing_page_contacts/1
  # PATCH/PUT /landing_page_contacts/1.json
  def update
    respond_to do |format|
      if @landing_page_contact.update(landing_page_contact_params)
        format.html { redirect_to @landing_page_contact, notice: 'Landing page contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @landing_page_contact }
      else
        format.html { render :edit }
        format.json { render json: @landing_page_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_page_contacts/1
  # DELETE /landing_page_contacts/1.json
  def destroy
    @landing_page_contact.destroy
    respond_to do |format|
      format.html { redirect_to landing_page_contacts_url, notice: 'Landing page contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing_page_contact
      @landing_page_contact = LandingPageContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landing_page_contact_params
      params.require(:landing_page_contact).permit(:name, :phone, :area, :industry_id, :suggestion, :email, :cellphone)
    end
end
