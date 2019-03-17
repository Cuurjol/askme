class Question < ApplicationRecord
  REGEXP = (/(?:\s|^)#(?!(?:[[:digit:]]+|[[:alnum:]]+_|_[[:alnum:]]+)(?:\s|$))([[:alnum:]]+(?:_[[:alnum:]]+)*)(?=\s|$)/).freeze

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :hashtags

  validates :user, presence: true
  validates :text, presence: true, length: { maximum: 255 }

  before_save :check_hashtags

  private

  def check_hashtags
    hashtags.clear unless hashtags.empty?
    hashtags_array = (text.scan(REGEXP).flatten + answer.scan(REGEXP).flatten).map(&:downcase).uniq
    create_hashtags_for_question(self, hashtags_array)
  end

  def create_hashtags_for_question(question, hashtags_array)
    hashtags_array.map do |item|
      hashtag = Hashtag.find_or_create_by(name: item.downcase)
      question.hashtags << hashtag
    end
  end
end
