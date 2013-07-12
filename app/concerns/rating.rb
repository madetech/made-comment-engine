require 'active_record'
require 'active_support/concern'

module Comment
  module RatingConcerns
    extend ActiveSupport::Concern

    included do
      attr_accessible                 :ratings,
                                      :ratings_attributes
    end
  end
end
