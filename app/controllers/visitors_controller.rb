class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      @member = Member.find_by id: current_user.id
      redirect_to members_path(:member_id => @member.id)
    end

  end

end
