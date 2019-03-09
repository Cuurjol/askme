class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions

  def to_param
    name
  end
end
