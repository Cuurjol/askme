class CreateJoinTableHashtagQuestion < ActiveRecord::Migration[5.2]
  def change
    create_join_table :hashtags, :questions do |t|
      t.index [:hashtag_id, :question_id]
      t.index :question_id
    end
  end
end
