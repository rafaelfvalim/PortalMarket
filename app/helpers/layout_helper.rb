module LayoutHelper

  def lef_menu_builder
    if current_user.is_customer?
      render 'layouts/left_menu_customer'
    elsif current_user.is_contributor?
      render 'layouts/left_menu_contributor'
    elsif current_user.is_god?
      render 'layouts/left_menu_admin'
    elsif current_user.is_customer_contributor?
      render 'layouts/left_menu_customer_contributor'
    end
  end

  def publication_count
    # Publication.joins(:folder).where('folders.name = ? and view_group = ?', search, view_group)
    view_group = Array.new
    view_group << 'Todos'
    view_group << current_user.publication_group
    count = Publication.where('view_group in (?)', view_group).count - ViewPublication.where(user_id: current_user.id).count
    return count
  end

end
