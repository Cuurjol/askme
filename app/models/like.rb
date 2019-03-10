class Like < ApplicationRecord
  belongs_to :user

  # https://yerb.net/blog/2014/03/13/three-easy-steps-to-using-counter-caches-in-rails/
  belongs_to :question, counter_cache: true

  validates :user, presence: true
  validates :question, presence: true
end
