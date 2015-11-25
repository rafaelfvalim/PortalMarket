class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      # Rails.logger.debug("DEBUG >>>> #{current_user.member_id}")
      if current_user.is_god?
        redirect_to admin_members_path
      else
        redirect_to members_path
      end

    end

  end

end
