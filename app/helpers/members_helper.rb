module MembersHelper

  def full_name
    member = current_user.member1B69B8
    "#{member.member_name} #{member.member_last_name}"
  end

  def dash_admin_icon(id)
    case id
      when 1 then
        'fa fa-floppy-o fa-5x'
      when 2 then
        'fa fa-files-o fa-5x'
      when 3 then
        'fa fa-database fa-5x'
      when 4 then
        'fa fa-cogs fa-5x'
      when 5 then
        'fa fa-check-square-o fa-5x'
    end
  end

  def dash_admin_panel_color(id)
    case id
      when 1 then
        'red'
      when 2 then
        'orange'
      when 3 then
        'yellow'
      when 4 then
        'green'
      when 5 then
        'blue'
    end
  end

  def linK_status_disable(count)
    return if count == 0 ? true : false
  end

end
