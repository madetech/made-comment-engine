class CreateCommentOpinions < ActiveRecord::Migration
  def change
    create_table :comment_opinions do |t|
      t.string          :name
      t.text            :text
      t.boolean         :published, :default => true
      t.references      :thread, :polymorphic => true
      t.timestamps
    end
  end
end
