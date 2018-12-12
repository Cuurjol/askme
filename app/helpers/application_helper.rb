module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def inclination(number, krokodil, krokodila, krokodilov)
    number = 0 if number.nil? || !number.is_a?(Numeric)

    return krokodilov if number % 100 >= 11 && number % 100 <= 14

    remainder = number % 10

    return krokodil if remainder == 1
    return krokodila if remainder >= 2 && remainder <= 4
    return krokodilov if (remainder >= 5 && remainder <= 9) || remainder.zero?
  end
end
