module MembersHelper

  def full_name(member)
     "#{member.member_name} #{member.member_last_name}"
  end

end
