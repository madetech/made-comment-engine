class AddTypeLastNameEmailToCommentOpinion < ActiveRecord::Migration
  def change
    add_column :comment_opinions, :email, :string
    add_column :comment_opinions, :last_name, :string
    add_column :comment_opinions, :type, :string

    Comment::Opinion.all.each do |comment|
      comment.email = "test@example.com"
      comment.last_name = "-"
      comment.type = "Comment::Opinion"
      comment.save
    end
  end
end
