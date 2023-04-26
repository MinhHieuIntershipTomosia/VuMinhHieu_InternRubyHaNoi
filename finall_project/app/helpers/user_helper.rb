# frozen_string_literal: true

# The UserHelper module contains methods displayed image of user.
module UserHelper
  def gravatar_for(user)
    if user.image.nil?
      image_tag('avatar-mac-dinh.png', alt: user.full_name, class: 'd-block ui-w-40 rounded-circle mx-2')
    else
      image_tag(user.image, alt: user.full_name, class: 'd-block ui-w-40 rounded-circle mx-2')
    end
  end

  def avatar_for(user)
    if user.image.nil?
      image_tag('avatar-mac-dinh.png', alt: user.full_name, class: 'avatar-mac-dinh.png')
    else
      image_tag(user.image, alt: user.full_name, class: 'rounded-circle')
    end
  end

  def avatar_header(user)
    if user.image.nil?
      image_tag('avatar-mac-dinh.png', alt: user.full_name, class: 'rounded-circle', width: '32px', height: '32px')
    else
      image_tag(user.image, alt: user.full_name, class: 'rounded-circle', width: '32px', height: '32px')
    end
  end
end
