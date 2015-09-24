class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      # Rails.logger.debug("DEBUG >>>> #{current_user.member_id}")
      redirect_to members_path
    end

  end

end
