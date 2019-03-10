class ResetLikesCountForQuestion < ActiveRecord::Migration[5.2]
  def up
    Question.reset_column_information
    Question.find_each do |question|
      Question.reset_counters(question.id, :likes)
    end
  end

  def down
    Question.update_all(likes_count: 0)
  end
end
