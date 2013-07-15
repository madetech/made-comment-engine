module Comment
  class Rating <  ActiveRecord::Base
    belongs_to                :rating, :polymorphic => true

    attr_accessible           :ip_address,
                              :score

    validates                 :score,
                              :inclusion=> { :in => Comment.config.rating_options },
                              :allow_nil => true,
                              :allow_blank => true
  end
end
