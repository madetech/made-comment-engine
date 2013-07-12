class CreateCommentRatings < ActiveRecord::Migration
  def change 
     create_table :comment_ratings do |t|
        t.string     :ip_address
        t.integer    :score
        t.references :rating, :polymorphic => true 
        t.timestamps
      end
    end 
end
