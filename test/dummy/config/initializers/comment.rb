Comment.config do |config|
  config.comment_class = Comment::Opinion
  config.commentable_objects = [DummyModel]
  config.engine_active_admin = true
  config.displayed = 5
end
