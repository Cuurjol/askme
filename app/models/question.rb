class Question < ApplicationRecord
  belongs_to :user
  has_one :author, class_name: 'User', dependent: :nullify

  validates :user, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end
