class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :hashtags

  validates :user, presence: true
  validates :text, presence: true, length: { maximum: 255 }

  after_create do
    regexp = /(?:\s|^)#(?!(?:[[:digit:]]+|[[:alpha:]]+?_|_[[:alpha:]]+?)(?:\s|$))([[:alnum:]]+(?:_[[:alnum:]]+)*)(?=\s|$)/
    question = Question.find(id)
    hashtags_array = text.scan(regexp).flatten.map(&:downcase).uniq

    create_hashtags_for_question(question, hashtags_array)
  end

  before_update do
    regexp = /(?:\s|^)#(?!(?:[[:digit:]]+|[[:alpha:]]+?_|_[[:alpha:]]+?)(?:\s|$))([[:alnum:]]+(?:_[[:alnum:]]+)*)(?=\s|$)/
    question = Question.find(id)
    question.hashtags.clear
    hashtags_array = (text.scan(regexp).flatten + answer.scan(regexp).flatten).map(&:downcase).uniq

    create_hashtags_for_question(question, hashtags_array)
  end

  private

  def create_hashtags_for_question(question, hashtags_array)
    hashtags_array.map do |item|
      hashtag = Hashtag.find_or_create_by(name: item.downcase)
      question.hashtags << hashtag
    end
  end
end
