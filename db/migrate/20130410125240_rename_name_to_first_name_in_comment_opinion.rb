class RenameNameToFirstNameInCommentOpinion < ActiveRecord::Migration
  def change
    rename_column :comment_opinions, :name, :first_name
  end
end
