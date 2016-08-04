class LandingPageAdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_active, if: :signed_in?

  # GET /landing_page_admins
  def index
  end


end
