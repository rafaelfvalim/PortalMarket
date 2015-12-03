class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      if current_user.is_god?
        redirect_to admin_members_path
      else
        redirect_to members_path
      end
    end

  end

end
