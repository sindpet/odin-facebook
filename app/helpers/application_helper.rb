module ApplicationHelper
  def profile_image(user)
    user.profile_pic_url? ? user.profile_pic_url : "https://doodleipsum.com/700/avatar-2?i=bf8b97258fa53643f64755c68b08041b"

    ##options[:class] = "" if options[:class].nil?
#
    #classes = "rounded-circle " + options[:class]
#
    #if user.profile_pic_url?
    #  image_tag user.profile_pic_url, class: classes
    #else
    #  image_tag "https://doodleipsum.com/700/avatar-2?i=bf8b97258fa53643f64755c68b08041b", class: classes
    #end

  end
end
