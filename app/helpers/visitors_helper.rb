module VisitorsHelper
  def selected_profile(user)
    if user.member.member_type.present?
      user.member.member_type.id
    end
    1
  end
end
