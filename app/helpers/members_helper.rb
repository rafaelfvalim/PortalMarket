module MembersHelper

  def full_name
     member = current_user.member
     "#{member.member_name} #{member.member_last_name}"
  end

end
