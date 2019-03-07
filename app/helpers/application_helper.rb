module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path('avatar.png')
    end
  end

  def fa_icon(icon_class)
    content_tag('span', '', class: "fa fa-#{icon_class}")
  end

  # https://gist.github.com/jasonyost/9db291478434b7f922f6
  # https://stackoverflow.com/questions/12102746/regex-to-match-hashtags-in-a-sentence-using-ruby
  def render_with_hashtags(text)
    regexp = /(?:\s|^)#(?!(?:[[:digit:]]+|[[:alpha:]]+?_|_[[:alpha:]]+?)(?:\s|$))([[:alnum:]]+(?:_[[:alnum:]]+)*)(?=\s|$)/
    text.gsub(regexp) { |word| link_to(word, hashtag_path(word.strip.delete('#')), class: 'hashtag-link') }.html_safe
  end
end
