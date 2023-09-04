module ApplicationHelper
  def profile_image(user, options={})
    image_tag "https://doodleipsum.com/700/avatar-2?i=bf8b97258fa53643f64755c68b08041b", class: options[:class] + " rounded-circle"
  end
end
