module ApplicationHelper

  # def emojify(content)
  #   h(content).to_str.gsub(/:([\w+-]+):/) do |match|
  #     if emoji = Emoji.find_by_alias($1)
  #       %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
  #     else
  #       match
  #     end
  #   end.html_safe if content.present?
  # end

  def online_status(user)
    content_tag :span, user.name,
                class: "user-#{user.id} online_status #{'online' if user.online?}"
  end

  def current_user_is_following(current_user_id, followed_user_id)
    relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
    return true if relationship
  end

end
