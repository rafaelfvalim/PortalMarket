module VisitorsHelper
  def selected_profile(user)
    if user.member.member_type.present?
      user.member.member_type.id
    end
    1
  end

  def landing_page_tabs_showcase(category_id)
    @scripts = Script.joins(:script_category).where('script_categories.category_id = ?', category_id)
  end





end
