module UsersHelper
  
  def small_avatar_of(user, location = nil)
    image_link = user.avatar.blank? ? image_path('avatars/default_50.png') : user.avatar.url(:small_thumb)
    if location == 'nav'
      image_tag image_link, size: "38x38", alt: user.username, title: user.username
    else
      link_to user_path(user) do
        image_tag image_link, size: "50x50", alt: user.username, title: user.username, class: 'img-circle'
      end
    end
  end

  def large_avatar_of(user)
    if user.avatar.blank?
      image_tag image_path('avatars/default_250.png'), size: "250x170", alt: user.username, title: user.username, class: 'img-circle',  itemprop: 'image'
    else
      link_to user_path(user) do
        image_tag user.avatar.url(:thumb), size: "250x250", alt: user.username, title: user.username, class: 'img-circle',  itemprop: 'image'
      end
    end
  end

  def sign_up_avatar(user)
    image_tag user.avatar.url(:thumb), size: "70x70", alt: user.username, title: user.username, class: 'img-circle'
  end 
  
end
