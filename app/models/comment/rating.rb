module Comment 
  class Rating <  ActiveRecord::Base
    belongs_to                :rating, :polymorphic => true

    attr_accessible           :ip_address,
                              :score
  end   
end 
