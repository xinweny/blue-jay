module UsersHelper
  def user_avatar(user)
    if user.image.present?
      user.image
    else
      image_url 'default_avatar.jpg'
    end
  end
end
