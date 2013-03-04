require "comment/engine"

module Comment
  class Engine < Rails::Engine
    isolate_namespace Comment

    initializer :comment, :after=> :engines_blank_point do
      ActiveAdmin.application.load_paths.unshift Dir[Comment::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)

      if !Comment.config.commentable_objects.blank?
        Comment.associate_commentable_objects
      end
    end
  end

  def self.config(&block)
    @@config ||= Comment::Engine::Configuration.new

    yield @@config if block

    return @@config
  end

  def self.associate_commentable_objects
    require File.join(Comment::Engine.root, 'app', 'concerns', 'comment')

    Comment.config.associate_objects.each do |obj|
      obj.class_eval do
        include Comment::CommentConcerns

        has_many                        :comments, :class_name => Comment::Opinion, :as => :thread
        accepts_nested_attributes_for   :comments
      end
    end
  end
end
