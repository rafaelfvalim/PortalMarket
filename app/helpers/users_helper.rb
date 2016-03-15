module UsersHelper

  def get_cicle_avatar(user)
    if user.avatar.present?
      image_tag user.avatar.circle_avatar.url.to_s, class: 'img-circle'
    else
      image_tag 'avatar-n-60x60.png', class: 'img-circle'
    end
  end

  def get_url_avatar(user)
    if user.avatar.present?
      user.avatar.circle_avatar.url.to_s
    else
      'avatar-n-60x60.png'
    end
  end

end
