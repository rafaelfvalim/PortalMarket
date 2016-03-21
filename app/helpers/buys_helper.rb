module BuysHelper

  def cart_already_in(script_id, member_id = current_user.member.id)
    if Cart.where('script_id = ? and member_id = ? and full_sale = 0', script_id, member_id).count > 0
      return true
    end
    return false
  end


end
