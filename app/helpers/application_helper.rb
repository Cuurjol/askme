module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      case user.gender
      when t('users.show.user.gender')[0] then asset_path('female.png')
      when t('users.show.user.gender')[1] then asset_path('male.png')
      else asset_path('avatar.png')
      end
    end
  end

  def fa_icon(icon_class)
    content_tag('span', '', class: "fa fa-#{icon_class}")
  end

  # https://gist.github.com/jasonyost/9db291478434b7f922f6
  # https://stackoverflow.com/questions/12102746/regex-to-match-hashtags-in-a-sentence-using-ruby
  def render_with_hashtags(text)
    text.gsub(Question::REGEXP) { |word| link_to(word, hashtag_path(word.strip.delete('#')), class: 'hashtag-link') }.html_safe
  end

  def user_bg_color(user)
    user.avatar_bg_color || '#005a55'
  end

  def user_border_color(user)
    user.avatar_border_color || '#00b6ad'
  end

  def user_text_color(user)
    user.profile_text_color || '#ffffff'
  end
end
