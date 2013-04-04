class AddIndexesToCommentOpinion < ActiveRecord::Migration
  def change
    add_index :comment_opinions, :published
    add_index :comment_opinions, :created_at
  end
end
