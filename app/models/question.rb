class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :likes, dependent: :delete_all
  has_and_belongs_to_many :hashtags

  validates :user, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end
