require 'active_record'
require 'active_support/concern'

module Comment
  module CommentConcerns
    extend ActiveSupport::Concern

    included do
      attr_accessible                 :comments,
                                      :comment_attributes
    end
  end
end
