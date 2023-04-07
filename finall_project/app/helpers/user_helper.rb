module UserHelper
  def gravatar_for(user)
    if user.image.nil?
      image_tag("avatar-mac-dinh.png", alt: user.full_name, class: "d-block ui-w-40 rounded-circle mx-2")
    else
      image_tag(user.image, alt: user.full_name, class: "d-block ui-w-40 rounded-circle mx-2")
    end
  end
end
