require "comment/engine"

module Comment
  mattr_accessor :cache_sweeper
  @@cache_sweeper = false

  mattr_accessor :comment_class
  @@comment_class = false

  mattr_accessor :rating_class
  @@rating_class = false

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

  mattr_accessor :commentable_objects
  @@commentable_objects = []

  mattr_accessor :rateable_objects
  @@rateable_objects = []

  mattr_accessor :per_page
  @@per_page = 5

  class Engine < Rails::Engine
    isolate_namespace Comment

    initializer :comment, :after=> :engines_blank_point do
      ActiveAdmin.application.load_paths.unshift Dir[Comment::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)

      if !Comment.config.commentable_objects.blank?
        Comment.associate_commentable_objects
      end

      if !Comment.config.rateable_objects.blank?
        Comment.associate_rateable_objects
      end
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end

  def self.associate_commentable_objects
    Comment.config.commentable_objects.each do |obj|
      obj.class_eval do
        require File.join(Comment::Engine.root, 'app', 'concerns', 'comment')

        include Comment::CommentConcerns

        has_many                        :comments, :class_name => Comment.config.comment_class, :as => :thread, :dependent => :destroy
        accepts_nested_attributes_for   :comments
      end
    end
  end

  def self.associate_rateable_objects
    Comment.config.rateable_objects.each do |obj|
      obj.class_eval do
        require File.join(Comment::Engine.root, 'app', 'concerns', 'rating')

        include Comment::RatingConcerns

        has_many                        :ratings, :class_name => Comment.config.rating_class, :as => :rating, :dependent => :destroy
        accepts_nested_attributes_for   :ratings
      end
    end
  end
end 
