class AddParentIdToCommentOpinion < ActiveRecord::Migration
  def change
    add_column :comment_opinions, :parent_id, :integer
  end
end
