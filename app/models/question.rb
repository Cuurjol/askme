class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :likes, dependent: :delete_all

  validates :user, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end
