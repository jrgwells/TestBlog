module ApplicationHelper
  def greeting
    if Time.now > "00:00".to_time && Time.now < "11:59".to_time
      return "Morning" 
    elsif Time.now > "11:59".to_time && Time.now < "17:59".to_time
      return "Afternoon"
    elsif Time.now > "18:00".to_time && Time.now < "23:59".to_time
      return "Evening"
    end
  end
  
  def gravatar_for(user, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle") 
  end
end
