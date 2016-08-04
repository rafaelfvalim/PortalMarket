class VisitorsController < ApplicationController
  before_action :set_landing_page_contact, only: [:show, :edit, :update, :destroy]

  def index
    @landing_texts = LandingText.all
    @landing_page_images = LandingPageImage.all
    @landing_page_banners = LandingPageBanner.order(:position)
    @landing_page_contact = LandingPageContact.new

    if user_signed_in?
      if current_user.is_god?
        redirect_to admin_members_path
      else
        redirect_to members_path
      end
    else
      @users = User.order("RAND()").limit(3)
      per_page = 8
      query = params[:query].present? ? params[:query] : "*"
      @scripts = Script.search query, where: {
          has_price: present?,
          status_id: [Status::APROVADO, Status::PRE_LANCAMENTO_APROVADO]
      }, page: params[:page], per_page: per_page

      respond_to do |format|
        format.js { render "results" }
        format.html {}
      end

    end

  end

  def index_teaser
    if user_signed_in?
      if current_user.is_god?
        redirect_to admin_members_path
      else
        redirect_to members_path
      end
    else
      render :layout => "teaser"
    end

  end

end
